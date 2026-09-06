#!/usr/bin/env bats
#
# Behavioral tests for gogh.sh's CLI argument parsing.
#
# These cover behavior that is ALREADY correct in the current gogh.sh, so
# they are expected to pass on this branch as-is (no dependency on any of
# the sibling bug-fix branches). See tests/gogh_regressions.bats for tests
# of bugs that are fixed on other branches but not yet present here.

setup() {
  REPO_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  GOGH="${REPO_ROOT}/gogh.sh"
}

@test "-h prints usage to stdout and exits 0" {
  run "$GOGH" -h
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage:"* ]]
}

@test "--help prints usage to stdout and exits 0" {
  run "$GOGH" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage:"* ]]
}

@test "a bare numeric argument is rejected with a non-zero exit status" {
  # NOTE: today this error text goes to stdout, not stderr -- a sibling
  # branch (see gogh_regressions.bats) fixes that separately. We don't
  # assert which stream it lands on here, only the exit code and message,
  # so this test keeps passing whichever stream ends up being used.
  run "$GOGH" 5
  [ "$status" -ne 0 ]
  [[ "$output" == *"INVALID OPTION"* ]]
}

@test "an unknown theme name/slug is rejected with a non-zero exit status" {
  run "$GOGH" totally-not-a-real-theme-xyz
  [ "$status" -ne 0 ]
  [[ "$output" == *"INVALID OPTION"* ]]
}

@test "-- followed by a valid theme slug gets past argument parsing" {
  # We don't need network access or a real display/dconf for this to
  # succeed at *applying* the theme -- that's out of scope here. We only
  # need to confirm parsing accepted the slug and didn't hit the
  # "INVALID OPTION" path. Feed an empty stdin and cap runtime with
  # `timeout` in case anything downstream tries to read interactively.
  run timeout 15 bash -c "printf '' | \"$GOGH\" -- dracula"
  [[ "$output" != *"INVALID OPTION"* ]]
}
