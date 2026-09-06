#!/usr/bin/env bats
#
# Regression tests for bugs fixed by the 04/05/09 hardening branches, now
# merged into gogh.sh. Kept as their own file (rather than folded into
# gogh_cli.bats) since these exercise timing/signals/network-failure paths
# rather than plain argument parsing.

setup() {
  REPO_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  GOGH="${REPO_ROOT}/gogh.sh"
}

@test "a narrow terminal (COLUMNS=40) does not crash with a division-by-zero error" {
  # With a narrow COLUMNS, NCOLS (columns of the theme table) could
  # previously compute to 0, and NROWS=$(( (ARRAYLENGTH-1)/NCOLS + 1 )) then
  # divided by zero. Feed empty stdin so the script falls through the
  # (empty) prompt and exits on its own once the listing is printed.
  run timeout 15 env COLUMNS=40 bash -c "printf '' | \"$GOGH\""

  [[ "$output" != *"division by 0"* ]]
}

@test "SIGINT actually terminates a running instance instead of hanging" {
  # Start gogh.sh with stdin attached to an open FIFO (no writer, no EOF)
  # so it blocks at the interactive "Enter OPTION(S)" prompt. Sending
  # SIGINT should make it actually terminate within a few seconds instead
  # of the trap silently swallowing the signal and leaving it running.
  #
  # `set -m` (job control) is required here: with job control off, Bash
  # sets SIGINT/SIGQUIT to be *ignored* for anything started with `&`,
  # which would make this test pass/fail for the wrong reason regardless
  # of whether gogh.sh's own trap is correct. With job control on, the
  # backgrounded job gets normal (non-ignored) signal disposition, the
  # same as an interactively-launched job -- which is what we want to
  # exercise here.
  set -m

  local fifo out_log pid i
  fifo="$(mktemp -u "${BATS_TEST_TMPDIR}/gogh_fifo.XXXXXX")"
  mkfifo "$fifo"
  out_log="${BATS_TEST_TMPDIR}/gogh_sigint.log"

  COLUMNS=100 "$GOGH" <"$fifo" >"$out_log" 2>&1 &
  pid=$!
  exec 9>"$fifo"

  sleep 1
  kill -INT "$pid"

  for i in 1 2 3 4 5; do
    kill -0 "$pid" 2>/dev/null || break
    sleep 1
  done

  ! kill -0 "$pid" 2>/dev/null
  local still_running=$?

  kill -9 "$pid" 2>/dev/null || true
  exec 9>&-
  rm -f "$fifo"

  [ "$still_running" -eq 0 ]
}

@test "a deliberately-broken BASE_URL causes gogh.sh to exit non-zero instead of silently succeeding" {
  # Copy only gogh.sh (no installs/, apply-colors.sh, apply-alacritty.py,
  # or apply-terminator.py alongside it) into an empty tmpdir. That forces
  # every helper-script/theme fetch through the (deliberately unroutable)
  # BASE_URL network path instead of using files that exist locally in the
  # real repo.
  local tmp_dir
  tmp_dir="$(mktemp -d "${BATS_TEST_TMPDIR}/gogh_nodl.XXXXXX")"
  cp "$GOGH" "${tmp_dir}/gogh.sh"
  chmod +x "${tmp_dir}/gogh.sh"

  run timeout 20 env BASE_URL="http://127.0.0.1:1/does-not-exist" bash -c \
    "printf '' | \"${tmp_dir}/gogh.sh\" -- dracula"

  rm -rf "$tmp_dir"

  [ "$status" -ne 0 ]
}
