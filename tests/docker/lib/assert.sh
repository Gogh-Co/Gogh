#!/usr/bin/env bash
# Shared pass/fail reporting for the tests/docker/run-*.sh suites. Sourced,
# not executed -- each suite calls check/fail directly and prints its own
# summary via suite_summary at the end.

PASS_COUNT=0
FAIL_COUNT=0

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  printf '  \033[32mok\033[0m  - %s\n' "$1"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf '  \033[31mFAIL\033[0m - %s\n' "$1"
  [ -n "${2:-}" ] && printf '       %s\n' "$2"
}

# assert_file_contains <label> <file> <needle>
assert_file_contains() {
  local label="$1" file="$2" needle="$3"
  if [ ! -f "$file" ]; then
    fail "$label" "file not found: $file"
    return
  fi
  if grep -qF -- "$needle" "$file"; then
    pass "$label"
  else
    fail "$label" "expected to find '$needle' in $file"
  fi
}

# assert_exit_zero <label> -- <command...>
assert_exit_zero() {
  local label="$1"; shift
  [ "$1" = "--" ] && shift
  if "$@" >/tmp/assert_out.$$ 2>&1; then
    pass "$label"
  else
    fail "$label" "exit $?: $(tail -c 300 /tmp/assert_out.$$)"
  fi
  rm -f /tmp/assert_out.$$
}

suite_summary() {
  echo
  echo "── ${1:-suite}: ${PASS_COUNT} passed, ${FAIL_COUNT} failed ──"
  [ "$FAIL_COUNT" -eq 0 ]
}
