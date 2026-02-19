package apply

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/Gogh-Co/Gogh/cli/internal/assets"
)

type Options struct {
	Stdout        io.Writer
	Stderr        io.Writer
	Stdin         io.Reader
	Env           []string
	PrintHeader   bool
	LogCommand    bool
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

	// Keep CLI/TUI install parity by always starting from parent env and ensuring
	// TERMINAL is present. Some Gogh scripts fail with "Supported terminals" when
	// TERMINAL is missing, so we infer it from the process tree if needed.
	env = ensureTerminalEnv(env)

	if opts.ForceNonInter {
		env = append(env, "GOGH_NONINTERACTIVE=1")
	}

	cmd := exec.Command("bash", scriptPath)
	cmd.Stdin = stdin
	cmd.Stdout = stdout
	cmd.Stderr = stderr
	// Run from extracted assets root so relative references remain stable.
	cmd.Dir = prepared.Root
	cmd.Env = append(env,
		"GOGH_APPLY_SCRIPT="+prepared.ApplyColors,
		"GOGH_ALACRITTY_SCRIPT="+prepared.ApplyAlacritty,
		"GOGH_TERMINATOR_SCRIPT="+prepared.ApplyTerminator,
	)

	if opts.LogCommand {
		fmt.Fprintf(stdout, "$ %s %q\n", cmd.Path, scriptPath)
		fmt.Fprintf(stdout, "  cwd=%s\n", cmd.Dir)
		fmt.Fprintf(stdout, "  TERMINAL=%q TERM=%q\n", envValue(cmd.Env, "TERMINAL"), envValue(cmd.Env, "TERM"))
	}

	if err := cmd.Run(); err != nil {
		exitCode := -1
		if ee, ok := err.(*exec.ExitError); ok {
			exitCode = ee.ExitCode()
		}
		return fmt.Errorf(
			"apply %q failed (exit code %d). command: %s %q, cwd: %s, TERMINAL=%q, TERM=%q: %w",
			theme.Name,
			exitCode,
			cmd.Path,
			scriptPath,
			cmd.Dir,
			envValue(cmd.Env, "TERMINAL"),
			envValue(cmd.Env, "TERM"),
			err,
		)
	}
	return nil
}

func ensureTerminalEnv(env []string) []string {
	if envValue(env, "TERMINAL") != "" {
		return env
	}
	terminal := detectTerminal(env)
	if terminal == "" {
		return env
	}
	return setEnvValue(env, "TERMINAL", terminal)
}

func detectTerminal(env []string) string {
	if t := envValue(env, "TERMINAL"); t != "" {
		return t
	}
	if t := normalizeTerminal(envValue(env, "TERM_PROGRAM")); t != "" {
		return t
	}
	pid := os.Getppid()
	for i := 0; i < 12 && pid > 1; i++ {
		comm, ppid, err := readProc(pid)
		if err != nil {
			break
		}
		if t := normalizeTerminal(comm); t != "" {
			return t
		}
		pid = ppid
	}
	return ""
}

func readProc(pid int) (comm string, ppid int, err error) {
	commBytes, err := os.ReadFile(filepath.Join("/proc", strconv.Itoa(pid), "comm"))
	if err != nil {
		return "", 0, err
	}
	statBytes, err := os.ReadFile(filepath.Join("/proc", strconv.Itoa(pid), "stat"))
	if err != nil {
		return "", 0, err
	}
	comm = strings.TrimSpace(string(commBytes))
	stat := string(statBytes)
	right := strings.LastIndexByte(stat, ')')
	if right == -1 || right+2 >= len(stat) {
		return comm, 0, nil
	}
	fields := strings.Fields(stat[right+2:])
	if len(fields) < 2 {
		return comm, 0, nil
	}
	ppid, _ = strconv.Atoi(fields[1])
	return comm, ppid, nil
}

func normalizeTerminal(raw string) string {
	r := strings.ToLower(strings.TrimSpace(raw))
	if r == "" {
		return ""
	}
	known := []string{
		"alacritty",
		"wezterm",
		"kitty",
		"gnome-terminal",
		"konsole",
		"xfce4-terminal",
		"terminator",
		"tilix",
		"xterm",
		"st",
		"rxvt",
		"urxvt",
		"mate-terminal",
		"lxterminal",
	}
	for _, k := range known {
		if strings.Contains(r, k) {
			return k
		}
	}
	return ""
}

func envValue(env []string, key string) string {
	prefix := key + "="
	for _, kv := range env {
		if strings.HasPrefix(kv, prefix) {
			return strings.TrimPrefix(kv, prefix)
		}
	}
	return ""
}

func setEnvValue(env []string, key, value string) []string {
	prefix := key + "="
	for i, kv := range env {
		if strings.HasPrefix(kv, prefix) {
			out := append([]string(nil), env...)
			out[i] = prefix + value
			return out
		}
	}
	out := append([]string(nil), env...)
	out = append(out, prefix+value)
	return out
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
