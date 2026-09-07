#!/usr/bin/env bats
#
# Smoke-tests that a handful of structurally different themes actually
# thread their own colors through apply-colors.sh -- the Docker suites in
# tests/docker/ only ever exercise Dracula, so a bug specific to another
# theme's installs/*.sh (missing var, unusual value) would go unnoticed.
#
# Runs against foot only: it's the one apply_* that creates its own config
# file from scratch (no dconf, no external package, no pre-existing file
# required), so this needs no Docker sandboxing -- $HOME is a throwaway
# dir under $BATS_TEST_TMPDIR, real host state is never touched.

setup() {
  REPO_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
}

# assert_theme_applies <slug>: sources the real installs/<slug>.sh (same
# contract gogh.sh uses) with TERMINAL=foot against an isolated $HOME, then
# checks the written foot.ini for that theme's own color_01/background --
# so the assertion is against the theme's actual values, not a hardcoded
# Dracula-specific needle.
assert_theme_applies() {
  local slug="$1" home cfg out status color01 background

  home="$(mktemp -d "${BATS_TEST_TMPDIR}/home.XXXXXX")"
  cfg="${home}/.config/foot/foot.ini"

  color01="$(sed -n 's/^export COLOR_01="\([^"]*\)".*/\1/p' "${REPO_ROOT}/installs/${slug}.sh" | tr -d '#')"
  background="$(sed -n 's/^export BACKGROUND_COLOR="\([^"]*\)".*/\1/p' "${REPO_ROOT}/installs/${slug}.sh" | tr -d '#')"

  # Guard against a silent false-pass: an empty needle would trivially
  # match "regular0=" (or "background=") in the written file regardless
  # of whether the real color made it through.
  [ -n "$color01" ] || { echo "could not extract COLOR_01 from installs/${slug}.sh"; return 1; }
  [ -n "$background" ] || { echo "could not extract BACKGROUND_COLOR from installs/${slug}.sh"; return 1; }

  out="$(HOME="$home" TERMINAL=foot GOGH_NONINTERACTIVE=1 LOOP=1 OPTLENGTH=1 \
      SCRIPT_PATH="$REPO_ROOT" bash -c "source '${REPO_ROOT}/installs/${slug}.sh'" 2>&1)"
  status=$?

  [ "$status" -eq 0 ] || { echo "$out"; return 1; }
  [ -f "$cfg" ] || { echo "no foot.ini written"; return 1; }
  grep -qF "regular0=${color01}" "$cfg" || { echo "missing color_01 ($color01) in:"; cat "$cfg"; return 1; }
  grep -qF "background=${background}" "$cfg" || { echo "missing background ($background) in:"; cat "$cfg"; return 1; }
}

@test "theme 'dracula' applies correctly through apply-colors.sh (foot)" {
  assert_theme_applies dracula
}

@test "theme 'aci' applies correctly through apply-colors.sh (foot)" {
  assert_theme_applies aci
}

@test "theme '1984-dark' applies correctly through apply-colors.sh (foot)" {
  assert_theme_applies 1984-dark
}

@test "theme 'cobalt2' applies correctly through apply-colors.sh (foot)" {
  assert_theme_applies cobalt2
}

@test "theme 'min-dark' applies correctly through apply-colors.sh (foot)" {
  assert_theme_applies min-dark
}
