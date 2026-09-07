# Docker-based tests

Integration tests that need something `task test` (shellcheck/bats/`bash -n`)
can't give us: a real installed terminal package, a real `ps` build, a real
(if fresh) dconf/D-Bus session. Every suite here runs entirely inside
disposable containers and never touches the host — see "Why Docker, never
the host" below before changing anything in here.

## Running

```bash
# everything
bash tests/docker/run-all.sh

# one suite
bash tests/docker/run-ps-compat.sh
bash tests/docker/run-gtk-terminals.sh
bash tests/docker/run-file-terminals.sh
```

Needs Docker. Not wired into `task test` or CI -- these are slower (image
builds, `apt-get install`) and Docker may not be available everywhere `task
test` runs. Run them by hand after touching `apply-colors.sh`/`gogh.sh`,
especially anything to do with `ps`, dconf/gsettings, or a specific
terminal's config file.

## What's covered

- **`run-ps-compat.sh`** -- the `ps -o comm=`/`ps -o ppid=` calls used to
  auto-detect `TERMINAL` when it isn't already set, across procps-ng
  3.3.17 (Debian bullseye), 4.0.2 (bookworm), and Alpine's procps-ng
  build. Regression-tests the ppid= trim fix specifically (confirmed it
  reproducibly breaks with "error: improper list" without the trim, on
  all three).
- **`run-gtk-terminals.sh`** -- GNOME Terminal, MATE Terminal, Tilix, and
  Guake, the real `apply-colors.sh` end to end (via `installs/dracula.sh`,
  the same contract a real install uses) against their real, installed
  gsettings schemas, in a fresh `dbus-run-session`. This is what caught
  the MATE-specific bug below. Guake writes straight into
  `guake.style.font` (no profile list, so no schema-default gap to hit)
  and gets its own check for that reason.
- **`run-file-terminals.sh`** -- xfce4-terminal, foot, Konsole, kitty,
  kmscon, Termux, Linux vt, mintty, Alacritty, Terminator, and Ghostty's
  config-writing logic. Also the real end-to-end path, checking the
  written config file contains the expected color. Alacritty and
  Terminator go through their Python helpers
  (`apply-alacritty.py`/`apply-terminator.py`), so this image also
  installs `requirements.txt`; this is what caught the Terminator bug
  below. Ghostty isn't an Ubuntu 24.04 apt package, but `apply_ghostty`
  only writes a file, so it's testable without it.

### Not covered, and why

- **Wezterm** -- applies colors via *runtime* OSC escape sequences, no
  config file at all. Nothing to assert against without a live PTY
  reading them; at most this could check the generated escape sequence
  *string* matches what's expected, without Wezterm installed.
- **Pantheon/elementary terminal** -- gsettings-based, but its schema
  isn't realistically installable outside actual elementary OS.
- **iTerm2 (`apply_darwin`)** -- macOS-only, can't run under Linux Docker
  at all.
- **Cygwin/mintty's own `$OS` detection** -- Windows/Cygwin-only; the
  underlying config-writing logic (`apply_cygwin`/`updateMinttyConfig`)
  is tested directly in `run-file-terminals.sh` with `TERMINAL=mintty`
  set explicitly, bypassing OS auto-detection.

## Three real bugs this caught while being built

All already fixed, kept here as the reason this exists:

1. **MATE Terminal false "no saved profiles found."** `apply_gtk()` had
   its own pre-flight check (`dconf list "${BASE_DIR%:}"` non-empty)
   separate from the `DEFAULT_SLUG` gsettings fallback fix from
   #351/#386/#552. It happened to keep working for GNOME Terminal and
   Tilix only because their `PROFILE_LIST_KEY` is a direct child of
   `BASE_DIR` (seeding the list incidentally populated it) -- MATE's
   `PROFILE_LIST_KEY` lives under a sibling `.../global/` subtree
   instead, so the exact fresh-install case the other fix resolved
   still failed this second, redundant check. Fixed by checking
   `DEFAULT_SLUG` directly instead of re-deriving profile existence from
   a terminal-specific path.
2. **Konsole silently wrote nothing on a fresh system.** `apply_konsole()`
   never created `~/.local/share/konsole/` before writing into it --
   `touch`/`echo` failed silently (no `set -e` in this codebase) and the
   script still exited 0, so a user would see no error and no theme.
   Fixed with a `mkdir --parents` before the first write.
3. **Terminator crashed on a fresh config.** `apply-terminator.py`'s
   `backup_conf()` unconditionally `shutil.copyfile()`s the existing
   config to make a backup, but `ConfigObj` doesn't require that file to
   already exist -- so a Terminator that had never been launched before
   (no `~/.config/terminator/config` yet) crashed with an unhandled
   `FileNotFoundError` instead of writing the theme. Fixed by skipping
   the backup when there's nothing to back up yet.

## Why Docker, never the host

Earlier in this project's history, a test that tried to isolate a `dconf
write` via `XDG_CONFIG_HOME` and separately via `dbus-run-session` on the
host -- both leaked the write into the real, live desktop session and
modified real user data. There is no known way to sandbox a `dconf
write` outside a container or VM on Linux. Every suite in this directory
runs the risky parts (anything that can invoke `dconf write`/`gsettings
set`, or that depends on a specific `ps`/package build) inside a
`docker run --rm` container, never directly on whatever machine is
running these tests.
