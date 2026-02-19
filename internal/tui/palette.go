package tui

import (
	"os"
	"path/filepath"
	"regexp"
	"strconv"
	"strings"
	"sync"

	"github.com/charmbracelet/lipgloss"

	"github.com/Gogh-Co/Gogh/cli/internal/assets"
)

type Palette struct {
	Colors     []string
	Background string
	Foreground string
	Cursor     string
}

var (
	paletteMu    sync.RWMutex
	paletteCache = map[string]Palette{}
	// Accept both plain and exported vars and tolerate trailing comments.
	// Example lines in Gogh scripts:
	//   export COLOR_01="#262626"  # Black
	//   BACKGROUND_COLOR="#282A36"
	varLineRE = regexp.MustCompile(`(?m)^\s*(?:export\s+)?([A-Z0-9_]+)\s*=\s*['\"]?(#?[0-9A-Fa-f]{6})['\"]?\b.*$`)
)

func getPalette(theme assets.Theme, prepared assets.Prepared) Palette {
	cacheKey := prepared.AssetVersionHash + ":" + theme.Script

	paletteMu.RLock()
	if p, ok := paletteCache[cacheKey]; ok {
		paletteMu.RUnlock()
		return p
	}
	paletteMu.RUnlock()

	scriptPath := filepath.Join(prepared.InstallsDir, theme.Script)
	b, err := os.ReadFile(scriptPath)
	if err != nil {
		p := defaultPalette()
		paletteMu.Lock()
		paletteCache[cacheKey] = p
		paletteMu.Unlock()
		return p
	}

	p := parsePaletteFromThemeScript(string(b))
	if len(p.Colors) == 0 {
		p = defaultPalette()
	}

	paletteMu.Lock()
	paletteCache[cacheKey] = p
	paletteMu.Unlock()
	return p
}

func parsePaletteFromThemeScript(script string) Palette {
	values := map[string]string{}
	matches := varLineRE.FindAllStringSubmatch(script, -1)
	for _, m := range matches {
		if len(m) != 3 {
			continue
		}
		k := strings.TrimSpace(m[1])
		v := normalizeHex(m[2])
		if v == "" {
			continue
		}
		values[k] = v
	}

	p := Palette{
		Background: values["BACKGROUND_COLOR"],
		Foreground: values["FOREGROUND_COLOR"],
		Cursor:     values["CURSOR_COLOR"],
	}

	for i := 1; i <= 16; i++ {
		k := "COLOR_" + twoDigits(i)
		if c := values[k]; c != "" {
			p.Colors = append(p.Colors, c)
		}
	}

	if len(p.Colors) == 0 {
		if p.Background != "" {
			p.Colors = append(p.Colors, p.Background)
		}
		if p.Foreground != "" {
			p.Colors = append(p.Colors, p.Foreground)
		}
		if p.Cursor != "" {
			p.Colors = append(p.Colors, p.Cursor)
		}
	}
	return p
}

func renderPaletteBar(p Palette, width int) string {
	if width <= 0 {
		return ""
	}
	colors := p.Colors
	if len(colors) == 0 {
		colors = defaultPalette().Colors
	}

	blockCount := 16
	switch {
	case width < 30:
		blockCount = max(4, width/3)
	case width < 48:
		blockCount = max(6, width/4)
	}
	blockCount = max(1, min(blockCount, width))
	blockW := max(1, width/blockCount)

	var b strings.Builder
	for i := 0; i < blockCount; i++ {
		segW := blockW
		if i == blockCount-1 {
			segW = width - (blockW * (blockCount - 1))
		}
		if segW <= 0 {
			segW = 1
		}
		c := colors[i%len(colors)]
		seg := lipgloss.NewStyle().Background(lipgloss.Color(c)).Render(strings.Repeat(" ", segW))
		b.WriteString(seg)
	}
	return b.String()
}

func defaultPalette() Palette {
	return Palette{Colors: []string{
		"#1F2430", "#F7768E", "#9ECE6A", "#E0AF68", "#7AA2F7", "#BB9AF7", "#7DCFFF", "#A9B1D6",
		"#414868", "#F7768E", "#9ECE6A", "#E0AF68", "#7AA2F7", "#BB9AF7", "#7DCFFF", "#C0CAF5",
	}}
}

func normalizeHex(v string) string {
	x := strings.TrimSpace(v)
	if x == "" {
		return ""
	}
	if !strings.HasPrefix(x, "#") {
		x = "#" + x
	}
	if len(x) != 7 {
		return ""
	}
	_, err := strconv.ParseUint(x[1:], 16, 24)
	if err != nil {
		return ""
	}
	return strings.ToUpper(x)
}

func twoDigits(n int) string {
	if n < 10 {
		return "0" + strconv.Itoa(n)
	}
	return strconv.Itoa(n)
}
