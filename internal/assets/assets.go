package assets

import (
	"bufio"
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strings"
	"unicode"
)

type Theme struct {
	Script string
	Name   string
}

type Prepared struct {
	Root             string
	InstallsDir      string
	ApplyColors      string
	ApplyAlacritty   string
	ApplyTerminator  string
	ThemesJSON       string
	AssetVersionHash string
}

func Prepare(cacheBase string) (Prepared, error) {
	if cacheBase == "" {
		cacheBase = defaultCacheBase()
	}
	if err := os.MkdirAll(cacheBase, 0o755); err != nil {
		return Prepared{}, fmt.Errorf("create cache dir: %w", err)
	}

	hash, err := embeddedHash()
	if err != nil {
		return Prepared{}, err
	}
	root := filepath.Join(cacheBase, "v-"+hash[:12])

	if err := extractAll(root); err != nil {
		return Prepared{}, err
	}

	return Prepared{
		Root:             root,
		InstallsDir:      filepath.Join(root, "installs"),
		ApplyColors:      filepath.Join(root, "apply-colors.sh"),
		ApplyAlacritty:   filepath.Join(root, "apply-alacritty.py"),
		ApplyTerminator:  filepath.Join(root, "apply-terminator.py"),
		ThemesJSON:       filepath.Join(root, "data", "themes.json"),
		AssetVersionHash: hash,
	}, nil
}

func ThemeCatalog() ([]Theme, error) {
	ordered, err := themeOrderFromGoghScript()
	if err != nil {
		return nil, err
	}
	if len(ordered) == 0 {
		return listThemesFromInstallsDir()
	}

	exists := map[string]bool{}
	entries, err := fs.ReadDir(embeddedFiles, "files/installs")
	if err != nil {
		return nil, fmt.Errorf("read embedded installs: %w", err)
	}
	for _, e := range entries {
		if e.IsDir() {
			continue
		}
		exists[e.Name()] = true
	}

	catalog := make([]Theme, 0, len(ordered))
	for _, script := range ordered {
		if !exists[script] {
			continue
		}
		catalog = append(catalog, Theme{Script: script, Name: formatThemeName(script)})
	}
	return catalog, nil
}

func ResolveTheme(query string, catalog []Theme) (Theme, bool) {
	trimmed := strings.TrimSpace(query)
	if trimmed == "" {
		return Theme{}, false
	}
	norm := normalizeThemeKey(trimmed)
	for _, t := range catalog {
		if strings.EqualFold(trimmed, t.Script) {
			return t, true
		}
		if norm == normalizeThemeKey(strings.TrimSuffix(t.Script, ".sh")) {
			return t, true
		}
		if norm == normalizeThemeKey(t.Name) {
			return t, true
		}
	}
	return Theme{}, false
}

func defaultCacheBase() string {
	if xdg := strings.TrimSpace(os.Getenv("XDG_CACHE_HOME")); xdg != "" {
		return filepath.Join(xdg, "gogh")
	}
	home, err := os.UserHomeDir()
	if err != nil || home == "" {
		return filepath.Join(os.TempDir(), "gogh-cache")
	}
	return filepath.Join(home, ".cache", "gogh")
}

func embeddedHash() (string, error) {
	files, err := listEmbeddedFiles()
	if err != nil {
		return "", err
	}
	h := sha256.New()
	for _, f := range files {
		b, err := fs.ReadFile(embeddedFiles, f)
		if err != nil {
			return "", fmt.Errorf("read embedded asset %s: %w", f, err)
		}
		_, _ = h.Write([]byte(f))
		_, _ = h.Write([]byte{0})
		_, _ = h.Write(b)
		_, _ = h.Write([]byte{0})
	}
	return hex.EncodeToString(h.Sum(nil)), nil
}

func listEmbeddedFiles() ([]string, error) {
	var files []string
	err := fs.WalkDir(embeddedFiles, "files", func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if d.IsDir() {
			return nil
		}
		files = append(files, path)
		return nil
	})
	if err != nil {
		return nil, fmt.Errorf("walk embedded assets: %w", err)
	}
	sort.Strings(files)
	return files, nil
}

func extractAll(root string) error {
	files, err := listEmbeddedFiles()
	if err != nil {
		return err
	}
	for _, src := range files {
		b, err := fs.ReadFile(embeddedFiles, src)
		if err != nil {
			return fmt.Errorf("read embedded file %s: %w", src, err)
		}
		rel := strings.TrimPrefix(src, "files/")
		dst := filepath.Join(root, filepath.FromSlash(rel))
		if err := atomicWriteFile(dst, b, fileModeFor(dst)); err != nil {
			return fmt.Errorf("extract %s: %w", rel, err)
		}
	}
	return nil
}

func atomicWriteFile(path string, content []byte, mode os.FileMode) error {
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return err
	}
	if current, err := os.ReadFile(path); err == nil {
		if sha256.Sum256(current) == sha256.Sum256(content) {
			_ = os.Chmod(path, mode)
			return nil
		}
	}
	tmp, err := os.CreateTemp(filepath.Dir(path), ".gogh-asset-*")
	if err != nil {
		return err
	}
	tmpPath := tmp.Name()
	defer func() { _ = os.Remove(tmpPath) }()

	if _, err := io.Copy(tmp, bytes.NewReader(content)); err != nil {
		_ = tmp.Close()
		return err
	}
	if err := tmp.Chmod(mode); err != nil {
		_ = tmp.Close()
		return err
	}
	if err := tmp.Close(); err != nil {
		return err
	}
	return os.Rename(tmpPath, path)
}

func fileModeFor(path string) os.FileMode {
	ext := strings.ToLower(filepath.Ext(path))
	if ext == ".sh" {
		return 0o755
	}
	return 0o644
}

func themeOrderFromGoghScript() ([]string, error) {
	content, err := fs.ReadFile(embeddedFiles, "files/gogh.sh")
	if err != nil {
		return nil, fmt.Errorf("read embedded gogh.sh: %w", err)
	}

	var scripts []string
	scanner := bufio.NewScanner(strings.NewReader(string(content)))
	inArray := false
	re := regexp.MustCompile(`'([^']+\.sh)'`)
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())
		if !inArray {
			if strings.HasPrefix(line, "declare -a THEMES=(") {
				inArray = true
			}
			continue
		}
		if line == ")" {
			break
		}
		m := re.FindStringSubmatch(line)
		if len(m) == 2 {
			scripts = append(scripts, m[1])
		}
	}
	if err := scanner.Err(); err != nil {
		return nil, fmt.Errorf("scan gogh.sh: %w", err)
	}
	return scripts, nil
}

func listThemesFromInstallsDir() ([]Theme, error) {
	entries, err := fs.ReadDir(embeddedFiles, "files/installs")
	if err != nil {
		return nil, fmt.Errorf("read embedded installs: %w", err)
	}
	catalog := make([]Theme, 0, len(entries))
	for _, e := range entries {
		if e.IsDir() || !strings.HasSuffix(e.Name(), ".sh") {
			continue
		}
		catalog = append(catalog, Theme{Script: e.Name(), Name: formatThemeName(e.Name())})
	}
	sort.Slice(catalog, func(i, j int) bool { return catalog[i].Name < catalog[j].Name })
	return catalog, nil
}

func formatThemeName(script string) string {
	name := strings.TrimSuffix(script, filepath.Ext(script))
	name = strings.ReplaceAll(name, "-", " ")
	name = strings.ReplaceAll(name, "_", " ")
	parts := strings.Fields(name)
	for i, p := range parts {
		parts[i] = titleWord(p)
	}
	return strings.Join(parts, " ")
}

func titleWord(s string) string {
	if s == "" {
		return s
	}
	r := []rune(strings.ToLower(s))
	r[0] = unicode.ToUpper(r[0])
	return string(r)
}

func normalizeThemeKey(s string) string {
	s = strings.ToLower(strings.TrimSpace(s))
	var b strings.Builder
	for _, r := range s {
		if unicode.IsLetter(r) || unicode.IsDigit(r) {
			b.WriteRune(r)
		}
	}
	return b.String()
}
