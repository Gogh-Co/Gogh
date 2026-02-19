package apply

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/Gogh-Co/Gogh/cli/internal/assets"
)

type Options struct {
	Stdout        io.Writer
	Stderr        io.Writer
	Stdin         io.Reader
	Env           []string
	PrintHeader   bool
	ForceNonInter bool
}

func Run(theme assets.Theme, prepared assets.Prepared, opts Options) error {
	scriptPath := filepath.Join(prepared.InstallsDir, theme.Script)
	if _, err := os.Stat(scriptPath); err != nil {
		return fmt.Errorf("theme script missing (%s): %w", theme.Script, err)
	}

	stdout := opts.Stdout
	if stdout == nil {
		stdout = os.Stdout
	}
	stderr := opts.Stderr
	if stderr == nil {
		stderr = os.Stderr
	}
	stdin := opts.Stdin
	if stdin == nil {
		stdin = os.Stdin
	}

	if opts.PrintHeader && !isNonInteractive(opts.Env) {
		fmt.Fprintf(stdout, "\nTheme: %s\n\n", theme.Name)
	}

	env := opts.Env
	if len(env) == 0 {
		env = os.Environ()
	}
	if opts.ForceNonInter {
		env = append(env, "GOGH_NONINTERACTIVE=1")
	}
	cmd := exec.Command("bash", scriptPath)
	cmd.Stdin = stdin
	cmd.Stdout = stdout
	cmd.Stderr = stderr
	cmd.Dir = prepared.Root
	cmd.Env = append(env,
		"GOGH_APPLY_SCRIPT="+prepared.ApplyColors,
		"GOGH_ALACRITTY_SCRIPT="+prepared.ApplyAlacritty,
		"GOGH_TERMINATOR_SCRIPT="+prepared.ApplyTerminator,
	)

	if err := cmd.Run(); err != nil {
		return fmt.Errorf("apply %q failed: %w", theme.Name, err)
	}
	return nil
}

func isNonInteractive(env []string) bool {
	if len(env) == 0 {
		_, ok := os.LookupEnv("GOGH_NONINTERACTIVE")
		return ok
	}
	for _, kv := range env {
		if len(kv) >= len("GOGH_NONINTERACTIVE=") && kv[:len("GOGH_NONINTERACTIVE=")] == "GOGH_NONINTERACTIVE=" {
			return true
		}
	}
	return false
}
