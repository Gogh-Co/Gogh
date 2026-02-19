package main

import (
	"bufio"
	"errors"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/Gogh-Co/Gogh/cli/internal/assets"
)

var version = "dev"

const usage = `Usage:
  gogh --version
  gogh --list
  gogh apply "Theme Name"
  gogh

Commands:
  --version   Print CLI version
  --list      List available themes (offline)
  apply       Apply one theme by name or script slug
  (no args)   Interactive mode
`

func main() {
	args := os.Args[1:]

	if len(args) > 0 {
		switch args[0] {
		case "--version", "-v", "version":
			fmt.Printf("gogh %s\n", version)
			return
		}
	}

	catalog, err := assets.ThemeCatalog()
	if err != nil {
		exitErr(err)
	}

	cacheDir := ""
	for i := 0; i < len(args); i++ {
		if args[i] == "--cache-dir" {
			if i+1 >= len(args) {
				exitErr(errors.New("--cache-dir requires a value"))
			}
			cacheDir = args[i+1]
			args = append(args[:i], args[i+2:]...)
			i--
		}
	}

	prepared, err := assets.Prepare(cacheDir)
	if err != nil {
		exitErr(err)
	}

	if len(args) == 0 {
		if err := runInteractive(catalog, prepared); err != nil {
			exitErr(err)
		}
		return
	}

	switch args[0] {
	case "--help", "-h", "help":
		fmt.Print(usage)
	case "--list", "list":
		printThemeList(catalog)
	case "apply":
		if len(args) < 2 {
			exitErr(errors.New("apply requires a theme name, e.g. gogh apply \"Dracula\""))
		}
		query := strings.Join(args[1:], " ")
		theme, ok := assets.ResolveTheme(query, catalog)
		if !ok {
			exitErr(fmt.Errorf("unknown theme %q", query))
		}
		if err := applyTheme(theme, prepared); err != nil {
			exitErr(err)
		}
	default:
		exitErr(fmt.Errorf("unknown command %q\n\n%s", args[0], usage))
	}
}

func runInteractive(catalog []assets.Theme, prepared assets.Prepared) error {
	printThemeList(catalog)
	fmt.Println("  (ALL) All themes")
	fmt.Println()
	fmt.Println("Usage: Enter theme numbers separated by spaces. Press ENTER to exit.")
	fmt.Print("Enter OPTION(S): ")

	reader := bufio.NewReader(os.Stdin)
	line, err := reader.ReadString('\n')
	if err != nil && !errors.Is(err, io.EOF) {
		return err
	}
	line = strings.TrimSpace(line)
	if line == "" {
		return nil
	}

	if strings.EqualFold(line, "ALL") {
		for _, t := range catalog {
			if err := applyTheme(t, prepared); err != nil {
				return err
			}
		}
		return nil
	}

	for _, token := range strings.Fields(line) {
		idx, convErr := strconv.Atoi(token)
		if convErr != nil {
			return fmt.Errorf("invalid option %q", token)
		}
		if idx < 1 || idx > len(catalog) {
			return fmt.Errorf("option %d out of range", idx)
		}
		if err := applyTheme(catalog[idx-1], prepared); err != nil {
			return err
		}
	}

	return nil
}

func printThemeList(catalog []assets.Theme) {
	fmt.Println("Themes:")
	for i, t := range catalog {
		fmt.Printf("  (%3d) %s\n", i+1, t.Name)
	}
}

func applyTheme(theme assets.Theme, prepared assets.Prepared) error {
	scriptPath := filepath.Join(prepared.InstallsDir, theme.Script)
	if _, err := os.Stat(scriptPath); err != nil {
		return fmt.Errorf("theme script missing (%s): %w", theme.Script, err)
	}

	if !isNonInteractive() {
		fmt.Printf("\nTheme: %s\n\n", theme.Name)
	}

	cmd := exec.Command("bash", scriptPath)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Dir = prepared.Root
	cmd.Env = append(os.Environ(),
		"GOGH_APPLY_SCRIPT="+prepared.ApplyColors,
		"GOGH_ALACRITTY_SCRIPT="+prepared.ApplyAlacritty,
		"GOGH_TERMINATOR_SCRIPT="+prepared.ApplyTerminator,
	)

	if err := cmd.Run(); err != nil {
		return fmt.Errorf("apply %q failed: %w", theme.Name, err)
	}
	return nil
}

func isNonInteractive() bool {
	_, ok := os.LookupEnv("GOGH_NONINTERACTIVE")
	return ok
}

func exitErr(err error) {
	fmt.Fprintln(os.Stderr, "error:", err)
	os.Exit(1)
}
