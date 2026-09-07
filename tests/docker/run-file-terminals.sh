#!/usr/bin/env bash
# Runs the real apply-colors.sh (via installs/dracula.sh, the same contract
# a real install uses) against terminals whose apply_* function just writes
# a plain config file -- no dconf/gsettings/D-Bus involved. Each one gets a
# fresh $HOME inside a disposable container.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
source lib/assert.sh
REPO_ROOT="$(cd ../.. && pwd)"

echo "=== file-based terminals ==="

docker build -q -t gogh-test-file file-terminals >/tmp/build_file.log 2>&1 \
  || { fail "docker build" "$(tail -c 500 /tmp/build_file.log)"; suite_summary "file-terminals" || exit 1; exit 0; }

# run_terminal <name> <terminal> <setup-shell-snippet> <resulting-config-file> <needle>
run_terminal() {
  local name="$1" terminal="$2" setup="$3" cfgfile="$4" needle="$5"

  local script="
set -e
export HOME=/root
$setup
export TERMINAL=$terminal
export GOGH_NONINTERACTIVE=1
export LOOP=1 OPTLENGTH=1
export SCRIPT_PATH=/repo
source /repo/installs/dracula.sh >/tmp/out 2>&1
echo APPLY_EXIT=\$?
cat /tmp/out
echo '--- config file ---'
cat '$cfgfile' 2>&1 || echo 'MISSING FILE'
"

  local out status
  out="$(docker run --rm -v "$REPO_ROOT:/repo:ro" gogh-test-file bash -c "$script" 2>&1)" && status=0 || status=$?

  if [ "$status" -ne 0 ] || ! echo "$out" | grep -q "APPLY_EXIT=0"; then
    fail "$name: apply-colors.sh exits 0" "$(echo "$out" | tail -c 500)"
    return
  fi
  pass "$name: apply-colors.sh exits 0"

  if echo "$out" | grep -qF -- "$needle"; then
    pass "$name: config file contains Dracula's $needle"
  else
    fail "$name: config file contains Dracula's $needle" "$(echo "$out" | tail -c 400)"
  fi
}

# Dracula's color_01 (#21222C) and background (#282A36) are used as needles
# below since they're each somewhat distinctive to this theme.

# With GOGH_NONINTERACTIVE and no GOGH_USE_NEW_THEME, apply_xfce4-terminal
# deliberately skips patching the live terminalrc (see #440) -- but it
# always writes the color scheme file itself, so check that instead.
run_terminal "xfce4-terminal" "xfce4-terminal" \
  "" \
  "/root/.local/share/xfce4/terminal/colorschemes/dracula.theme" \
  "282A36"

run_terminal "foot" "foot" \
  "" \
  "/root/.config/foot/foot.ini" \
  "21222C"

# .profile only has metadata (name, parent, which colorscheme to use) --
# the actual colors live in the separate .colorscheme file, as decimal RGB
# (no spaces): #21222C = 33,34,44.
run_terminal "konsole" "konsole" \
  "mkdir -p /root/.config && echo 'DefaultProfile=Dracula.profile' > /root/.config/konsolerc" \
  "/root/.local/share/konsole/Dracula.colorscheme" \
  "33,34,44"

run_terminal "kitty" "kitty" \
  "mkdir -p /root/.config/kitty && touch /root/.config/kitty/kitty.conf" \
  "/root/.config/kitty/colors.conf" \
  "21222C"

# kmscon stores colors as decimal RGB triples, not hex: #21222C = 33,34,44.
run_terminal "kmscon" "kmscon" \
  "mkdir -p /etc/kmscon && touch /etc/kmscon/kmscon.conf" \
  "/etc/kmscon/kmscon.conf" \
  "33, 34, 44"

run_terminal "termux" "termux" \
  "mkdir -p /root/.termux" \
  "/root/.termux/colors.properties" \
  "#21222c"

# apply_linux_vt picks the system-wide dir only when $USER = "root", but
# $USER is unset in a plain container (no login shell set it) even though
# we are root (id -u = 0) -- a real portability gap worth knowing about,
# separate from what this test checks. So it falls back to ~/.vtrgb-gogh
# here, same as any non-root user would get.
run_terminal "linux (vt)" "linux" \
  "" \
  "/root/.vtrgb-gogh/Dracula" \
  "#21222C"

# mintty: regression-test the #385/#553 append fix specifically, by seeding
# a .minttyrc that's missing the Black= key entirely instead of leaving it
# to be created fresh -- that's the exact case the old replace-only sed
# used to silently drop.
run_terminal "mintty (missing key)" "mintty" \
  "mkdir -p /root && printf 'BoldBlack=100,100,100\n' > /root/.minttyrc" \
  "/root/.minttyrc" \
  "Black="

suite_summary "file-terminals"
