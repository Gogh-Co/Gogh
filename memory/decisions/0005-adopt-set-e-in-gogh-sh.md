# 0005. Adopt `set -e` in `gogh.sh`, after auditing every place it would break

- Status: Accepted
- Date: 2026-09-06

## Context

Branch `08-audit-and-adopt-strict-mode` (see [ADR 0004](0004-gogh-sh-installer-hardening-series.md))
deliberately stopped at `set -uo pipefail`, leaving `-e` for later specifically
because enabling it blindly risked breaking working code that currently relies on
tolerating a nonzero exit. With branch 07's Bats suite in place as a regression
net, this follow-up did that audit and adopted `-e`.

The audit found several real, confirmed places `-e` would have broken the script,
verified by directly reproducing each one (not just reasoning about it):

- `declare C$n=$(tput setaf $n)` / `CR=$(tput sgr0)` / `CS0=$(tput sgr 0)` (the
  very first executable lines) — `tput` exits non-zero on a terminal that lacks
  the requested capability. Confirmed: `TERM=dumb` (a real, common case — every
  test in this session used it) made the script abort immediately at line 6
  under `-e`, before printing anything.
- Likewise `tput clear` and the two `${COLUMNS:-$(tput cols)}` uses — one of
  these two is inside an `if [[ ... ]]` condition (already exempt from `-e` by
  Bash's own rules for command substitutions inside a tested condition, confirmed
  by direct reproduction of that exemption), but the other is inside a plain
  `NCOLS=$(( ... ))` arithmetic assignment (not exempt) and, when it produced an
  empty value, caused an arithmetic *syntax* error ("operand expected") rather
  than a clean abort or a clean fallback.
- `ARG_THEME_NUMBER=$(get_theme_number_from_selector "${ARG}")` — this function's
  designed "not found" signal is `return 1`; under `-e` this is exactly the
  bare-name-typo path (a very common one) and would abort *before* the existing
  `if [[ -n "${ARG_THEME_NUMBER}" ]]` check ever got to print "INVALID OPTION".
- Both interactive `read -r -p ... -a OPTION` / `read -r -p ... TILIX_RES` calls
  — `read` returns non-zero on EOF/closed stdin, which the script currently
  relies on to fall through to its own default behavior (exit cleanly / default
  Tilix answer) rather than abort.
- The `ps`-based terminal-detection fallback loop (`pid="$(ps -h -o ppid -p
  $pid)"` / `TERMINAL="$(ps -h -o comm -p $pid)"`) — already flagged as fragile
  in the original review; a `ps` failure here (e.g. walking past the top of the
  process tree) would abort the whole install over a cosmetic terminal-name
  lookup.
- `((col++))` / `((row++))` in the theme-listing grid — the classic Bash `-e`
  gotcha: a standalone `((expr))` command's exit status reflects whether *expr*
  evaluated to zero or non-zero, not whether the arithmetic itself succeeded. On
  the very first iteration (`col`/`row` starting at 0), post-increment evaluates
  to the *old* value (0 → "failure"), which would have aborted the script on the
  first cell of the theme listing — i.e. the single most common invocation
  (interactive mode, no args) would never have worked at all.

## Decision

Fix each of the above (guard the `tput` calls and the `ps` fallback and the two
`read`s with `|| true`; give the `NCOLS` line's `tput cols` an explicit `|| echo
80` numeric fallback instead of a bare `|| true`; change `get_theme_number_from_selector`'s
call site to `... || true` so its existing `-n` check still runs; switch
`((col++))`/`((row++))` to pre-increment `((++col))`/`((++row))`, which changes
nothing behaviorally but always evaluates non-zero once the counter has actually
advanced), then change the shebang line to `set -euo pipefail`.

Verified against the fully merged, patched script: `bats tests/` (8/8, run
twice), `shellcheck --severity=error` clean, plus direct reproduction of every
scenario above (minimal/empty environment with `TERM=dumb`, zero-padded input
`8`/`08`/`008`/`0008`, `COLUMNS=40`, a deliberately broken `BASE_URL`, `-h`, and a
real theme name) all behaving the same as before this change — no new failures,
and the specific `-e` regressions above no longer reproduce.

## Consequences

- `gogh.sh` now fails fast and loud on a genuinely unexpected internal error
  (e.g. `mktemp` failing) instead of silently limping on with a broken
  variable — this was the actual goal of adopting `-e`.
- The fix list above is not a general "make everything `-e`-proof" pass; it's
  scoped to what was actually found by exercising the real invocation paths.
  Any *new* code added to `gogh.sh` later needs the same discipline: a plain
  `VAR=$(cmd)` assignment, a bare `read`, or a standalone `((expr))` are the
  three concrete footguns this audit turned up, and are worth checking for
  specifically in review, not just "does `bash -n` pass".
- The full ShellCheck backlog (~40 pre-existing warning/info findings, see ADR
  0004's consequences) is unrelated to this change and remains untouched.
