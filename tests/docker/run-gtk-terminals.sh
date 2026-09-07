#!/usr/bin/env bash
# Runs the real apply-colors.sh end-to-end (not a hand-extracted snippet)
# against GNOME Terminal, MATE Terminal, and Tilix's real, installed
# gsettings schemas, in a disposable container with its own isolated
# dconf/D-Bus session -- never the host's. This is what caught the real
# "list stays empty, profile silently dropped" bug this suite guards
# against (see docs/ISSUE_POLICY.md-adjacent history: #351/#386/#320/#552).
#
# IMPORTANT: never attempt this against the host's dconf. XDG_CONFIG_HOME
# overrides and dbus-run-session were both tried once on the host and BOTH
# leaked a real write into the user's actual profile -- there is no known
# way to sandbox a dconf write outside a container. See CLAUDE history for
# the incident; this file exists so nobody has to relearn that the hard way.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
source lib/assert.sh
REPO_ROOT="$(cd ../.. && pwd)"

echo "=== GTK/dconf terminals (GNOME, MATE, Tilix) ==="

docker build -q -t gogh-test-gtk gtk-terminals >/tmp/build_gtk.log 2>&1 \
  || { fail "docker build" "$(tail -c 500 /tmp/build_gtk.log)"; suite_summary "gtk-terminals" || exit 1; exit 0; }

run_terminal() {
  local terminal="$1" schema="$2" list_key="$3"

  # installs/dracula.sh runs apply_theme itself as soon as it's sourced
  # (that's the real, faithful install contract -- see installs/*.sh), so
  # TERMINAL/GOGH_NONINTERACTIVE must be exported *before* sourcing it, not
  # after: doing it after lets dracula.sh's own auto-run fall through to
  # apply-colors.sh's ps-based auto-detection instead, against a process
  # tree that doesn't resemble a real terminal at all in a container.
  local script="
set -e
export TERMINAL=$terminal
export GOGH_NONINTERACTIVE=1
export LOOP=1 OPTLENGTH=1
export SCRIPT_PATH=/repo
source /repo/installs/dracula.sh >/tmp/apply_out.\$\$ 2>&1
echo '--- apply-colors.sh output ---'
cat /tmp/apply_out.\$\$
echo '--- profile list after apply ---'
gsettings get $schema $list_key
"

  local out status
  out="$(docker run --rm -v "$REPO_ROOT:/repo:ro" gogh-test-gtk \
      dbus-run-session -- bash -c "$script" 2>&1)" && status=0 || status=$?

  if [ "$status" -ne 0 ]; then
    fail "$terminal: apply-colors.sh exits 0" "exit $status: $(echo "$out" | tail -c 500)"
    return
  fi
  pass "$terminal: apply-colors.sh exits 0"

  if echo "$out" | grep -qi "no saved profiles found\|not a valid identifier\|two consecutive slashes\|error"; then
    fail "$terminal: no dconf/profile errors" "$(echo "$out" | tail -c 500)"
  else
    pass "$terminal: no dconf/profile errors"
  fi

  local list_line
  list_line="$(echo "$out" | tail -1)"
  if echo "$list_line" | grep -qE "^\['" ; then
    pass "$terminal: profile list is non-empty after apply ($list_line)"
  else
    fail "$terminal: profile list is non-empty after apply" "got: $list_line"
  fi
}

run_terminal gnome-terminal org.gnome.Terminal.ProfilesList list
run_terminal mate-terminal org.mate.terminal.global profile-list
run_terminal tilix com.gexperts.Tilix.ProfilesList list

suite_summary "gtk-terminals"
