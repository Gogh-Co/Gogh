# Gogh CLI (offline, single binary)

This is an independent subproject inside this repository.

## What it does

Builds an executable named `gogh` that:

- Works offline (no `curl`/`wget`/runtime downloads)
- Embeds Gogh scripts/themes into the binary
- Extracts embedded assets to cache (`$XDG_CACHE_HOME/gogh` or `~/.cache/gogh`)
- Supports:
  - `gogh --version`
  - `gogh --list`
  - `gogh apply "Theme Name"`
  - `gogh` (interactive mode)

## Project layout

- `cmd/gogh/main.go` — CLI entrypoint
- `internal/assets` — embedded assets + extraction logic
- `dist/` — build output for this subproject

## Build

From this `cli` directory:

```bash
make build
```

Cross-build Linux/macOS:

```bash
make release
```

## Quick test plan

```bash
# print version
./dist/gogh --version

# list themes
./dist/gogh --list

# apply one theme
TERMINAL=gnome-terminal ./dist/gogh apply "Dracula"

# quiet non-interactive mode
GOGH_NONINTERACTIVE=1 TERMINAL=gnome-terminal ./dist/gogh apply "Dracula"
```
