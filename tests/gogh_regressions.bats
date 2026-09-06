#!/usr/bin/env bats
#
# Regression tests for bugs that sibling hardening branches fix in gogh.sh,
# but that are NOT yet present in this branch's copy of gogh.sh (this
# worktree was branched from the original, unfixed script). Each test body
# is real and runnable -- `skip` just keeps it from executing/failing on
# THIS branch. Once the named sibling branch is merged, delete the `skip`
# line (and re-check the assertion still matches the fix) to bring the
# test online.

setup() {
  REPO_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  GOGH="${REPO_ROOT}/gogh.sh"
}

@test "a narrow terminal (COLUMNS=40) does not crash with a division-by-zero error" {
  skip "fixed by 09-minor-correctness-fixes, not yet merged"

  # With a narrow COLUMNS, NCOLS (columns of the theme table) can currently
  # compute to 0, and NROWS=$(( (ARRAYLENGTH-1)/NCOLS + 1 )) then divides by
  # zero. Feed empty stdin so the script falls through the (empty) prompt
  # and exits on its own once the listing is printed/would-be-printed.
  run timeout 15 env COLUMNS=40 bash -c "printf '' | \"$GOGH\""

  [[ "$output" != *"division by 0"* ]]
}

@test "SIGINT actually terminates a running instance instead of hanging" {
  skip "fixed by 05-fix-signal-trap-handling, not yet merged"

  # Start gogh.sh with stdin attached to an open FIFO (no writer, no EOF)
  # so it blocks at the interactive "Enter OPTION(S)" prompt. Sending
  # SIGINT should make it actually terminate within a few seconds instead
  # of the trap silently swallowing the signal and leaving it running.
  local fifo out_log pid i
  fifo="$(mktemp -u "${BATS_TEST_TMPDIR}/gogh_fifo.XXXXXX")"
  mkfifo "$fifo"
  out_log="${BATS_TEST_TMPDIR}/gogh_sigint.log"

  exec 9<>"$fifo"
  COLUMNS=100 "$GOGH" <&9 >"$out_log" 2>&1 &
  pid=$!

  sleep 1
  kill -INT "$pid"

  for i in 1 2 3 4 5; do
    kill -0 "$pid" 2>/dev/null || break
    sleep 1
  done

  ! kill -0 "$pid" 2>/dev/null
  local still_running=$?

  kill -9 "$pid" 2>/dev/null
  exec 9>&-
  rm -f "$fifo"

  [ "$still_running" -eq 0 ]
}

@test "a deliberately-broken BASE_URL causes gogh.sh to exit non-zero instead of silently succeeding" {
  skip "fixed by 04-harden-downloads-exit-codes, not yet merged"

  # Copy only gogh.sh (no installs/, apply-colors.sh, apply-alacritty.py,
  # or apply-terminator.py alongside it) into an empty tmpdir. That forces
  # every helper-script/theme fetch through the (deliberately unroutable)
  # BASE_URL network path instead of using files that exist locally in the
  # real repo. Today, a failed/empty wget|curl still lets the script reach
  # its final `|| :`-guarded exit and report success.
  local tmp_dir
  tmp_dir="$(mktemp -d "${BATS_TEST_TMPDIR}/gogh_nodl.XXXXXX")"
  cp "$GOGH" "${tmp_dir}/gogh.sh"
  chmod +x "${tmp_dir}/gogh.sh"

  run timeout 20 env BASE_URL="http://127.0.0.1:1/does-not-exist" bash -c \
    "printf '' | \"${tmp_dir}/gogh.sh\" -- dracula"

  rm -rf "$tmp_dir"

  [ "$status" -ne 0 ]
}
