# Gogh CLI (offline, single binary)

Offline wrapper for Gogh themes, built as a single `gogh` binary.

## What it does

- Works fully offline (no runtime downloads/web calls)
- Embeds Gogh assets in the binary
  - `apply-colors.sh`
  - `apply-alacritty.py`
  - `apply-terminator.py`
  - `installs/*.sh`
  - `data/themes.json`
- Extracts assets idempotently to cache:
  - `$XDG_CACHE_HOME/gogh` (preferred)
  - `~/.cache/gogh` (fallback)
- Keeps existing env compatibility (`TERMINAL`, `GOGH_NONINTERACTIVE`, `GOGH_USE_NEW_THEME`, etc.)

## Current project structure

- `cmd/gogh/main.go` — CLI entrypoint (`--list`, `apply`, `tui`, interactive)
- `internal/assets` — embedded assets + extraction + theme catalog
- `internal/apply` — shared theme apply flow used by CLI and TUI
- `internal/tui` — Bubble Tea/Lip Gloss TUI implementation
- `dist/` — local build output
- `Makefile` — build/release tasks
- `go.mod` / `go.sum` — module + dependencies

## Commands

```bash
gogh --version
gogh --list
gogh apply "Dracula"
gogh tui
gogh
```

## TUI (`gogh tui`)

Features:

- Responsive multi-column theme grid
- Live search filtering
- Arrow navigation (also `hjkl`)
- `Enter` installs selected theme
- Install screen with spinner + live logs (scrollable viewport)
- Success/error result screen and return to browser

Keys:

- `↑↓←→` / `hjkl` move
- `Enter` install selected theme
- `/` focus search
- `Esc` clear search / back
- `PgUp` / `PgDn` page move
- `Home` / `End` jump start/end
- `b` back from result
- `q` quit

## Build

From repo root:

```bash
make build
```

Build with explicit version:

```bash
make build VERSION=0.2.0
```

Cross-build Linux/macOS:

```bash
make release VERSION=0.2.0
```

## Minimal test plan

```bash
# version
./dist/gogh --version

# list (offline)
./dist/gogh --list

# TUI opens
./dist/gogh tui

# apply from CLI
TERMINAL=gnome-terminal ./dist/gogh apply "Dracula"

# non-interactive apply
GOGH_NONINTERACTIVE=1 TERMINAL=gnome-terminal ./dist/gogh apply "Dracula"
```

Manual TUI checks:

- Filter updates as you type
- Grid navigation works across terminal resizes
- Install runs and logs stream in the install panel
