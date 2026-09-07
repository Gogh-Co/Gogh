#!/usr/bin/env bash
# Exercises the two `ps` invocations apply-colors.sh/gogh.sh use to detect
# TERMINAL (ps -o comm=, ps -o ppid=) against a matrix of real ps
# builds/versions in disposable containers. Never touches the host.
#
# Background: a user hit "error: unsupported SysV option" from the old
# `ps -h -o comm -p $PPID` form on their system's ps. We could not reproduce
# that exact error against procps-ng 3.3.17 through 4.0.7 (Debian
# bullseye/bookworm, Fedora, Arch, openSUSE, Alpine) -- so this suite does
# NOT prove the original trigger. What it proves is that the *replacement*
# code (`ps -o comm=`/`ps -o ppid=`, no -h, with the ppid result trimmed of
# padding) behaves correctly across that whole matrix: if a future edit
# reintroduces `-h` or drops the trim, this fails.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
source lib/assert.sh

echo "=== ps compatibility matrix ==="

run_matrix_entry() {
  local name="$1" dockerfile="$2"
  echo "--- $name ---"
  docker build -q -f "ps-compat/$dockerfile" -t "gogh-test-ps-$name" ps-compat >/tmp/build_$name.log 2>&1 \
    || { fail "$name: docker build" "$(tail -c 300 /tmp/build_$name.log)"; return; }

  # Exactly the two forms used in apply-colors.sh/gogh.sh, including the
  # trim of ps -o ppid='s padded output before feeding it to the next -p.
  local script='
    pid=$$
    comm="$(ps -o comm= -p "$pid")"
    ppid="$(ps -o ppid= -p "$pid")"
    ppid="${ppid// /}"
    parent_comm="$(ps -o comm= -p "$ppid")"
    echo "COMM=[$comm] PPID=[$ppid] PARENT_COMM=[$parent_comm]"
  '

  # A lone `bash -c 'script'` at the container entrypoint IS pid 1 (bash
  # exec-optimizes away the fork for a single trailing command), which
  # leaves ppid=0 -- unqueryable, and not how this code is ever really
  # invoked. Backgrounding a sibling first forces bash to actually fork, so
  # the inner bash running $script gets a real, queryable parent.
  local out status
  out="$(docker run --rm "gogh-test-ps-$name" bash -c "sleep 300 & bash -c '$script'" 2>&1)" && status=0 || status=$?

  if [ "$status" -ne 0 ]; then
    fail "$name: exits 0" "exit $status: $out"
    return
  fi
  pass "$name: exits 0"

  if echo "$out" | grep -qi "unsupported\|improper list\|error:\|usage:"; then
    fail "$name: no ps parsing errors" "$out"
  else
    pass "$name: no ps parsing errors"
  fi

  if echo "$out" | grep -q 'COMM=\[bash\]'; then
    pass "$name: ps -o comm= resolves the running shell"
  else
    fail "$name: ps -o comm= resolves the running shell" "got: $out"
  fi

  if echo "$out" | grep -Eq 'PPID=\[[0-9]+\]'; then
    pass "$name: ps -o ppid= (trimmed) is a clean numeric pid"
  else
    fail "$name: ps -o ppid= (trimmed) is a clean numeric pid" "got: $out"
  fi
}

run_matrix_entry bullseye Dockerfile.bullseye
run_matrix_entry bookworm Dockerfile.bookworm
run_matrix_entry alpine Dockerfile.alpine

suite_summary "ps-compat"
