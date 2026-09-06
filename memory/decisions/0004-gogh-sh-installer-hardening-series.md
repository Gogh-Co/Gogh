# 0004. Harden `gogh.sh`'s installer safety and reliability via a 9-branch fix series

- Status: Accepted
- Date: 2026-09-06

## Context

A security/correctness review of `gogh.sh` (the installer, run via the README's
`bash -c "$(curl|wget ...)"` one-liner) found several concrete, reproduced bugs:

- An unnecessary `eval` of a third-party script (`phenonymous/shell-progressbar`,
  a different GitHub org, pinned to a mutable tag) for a cosmetic progress bar.
- `SCRIPT_PATH` silently resolving to the current working directory instead of a
  real script path when run via `bash -c "..."` (`BASH_SOURCE[0]` is empty in that
  mode), letting a same-named local file be executed instead of the real one from
  `BASE_URL`.
- Downloads (`curl`/`wget`) with no timeout, no availability check, and no
  verification that the result was non-empty — a failed download could produce an
  empty string that `bash -c ""` executes as a silent no-op with exit code 0.
- A signal trap (`trap '...' EXIT HUP INT QUIT PIPE TERM`) that ran cleanup but
  never called `exit`, so `SIGINT`/`SIGTERM` left the process running instead of
  terminating it (verified: still alive 3s+ after `SIGINT`).
- Error/diagnostic messages printed to `stdout` instead of `stderr`.
- No Bash-specific CI at all (no `bash -n`, no shellcheck, no behavioral tests),
  despite `gogh.sh` being a watched path in `validate-on-pr.yml`.
- A division-by-zero crash on narrow terminals (`COLUMNS=40`), incomplete
  leading-zero handling for interactive theme numbers (`008` still broke), and
  `apply-alacritty.py` overwriting the user's config with no backup.

Full evidence, repro commands, and severity ratings for each item were captured in
a working document, `PLAN_DE_MEJORAS.md` (deleted from the repo root now that this
ADR and the actual commits are the durable record of what was found and done).

## Decision

Fix each item on its own numbered branch (`01-remove-third-party-progressbar-eval`
through `09-minor-correctness-fixes`), authored in parallel by independent agents
against a shared base commit, then merge all nine into `master` in order with
`--no-ff` (one merge commit per branch, so each fix stays identifiable and
revertable as a unit via `git revert -m 1 <merge-commit>`):

```
3c92ed6 Merge branch '01-remove-third-party-progressbar-eval'
1e9a453 Merge branch '02-tilix-prompt-respect-noninteractive'
bf64d63 Merge branch '03-fix-script-path-remote-detection'
8617759 Merge branch '04-harden-downloads-exit-codes'
20b6437 Merge branch '05-fix-signal-trap-handling'
312ddd1 Merge branch '06-separate-stdout-stderr-diagnostics'
d46efee Merge branch '07-add-bash-ci-lint-and-tests'
5968b18 Merge branch '08-audit-and-adopt-strict-mode'
1b56415 Merge branch '09-minor-correctness-fixes'
```

Branch 08 deliberately adopted only `set -uo pipefail`, not `-e` — enabling `-e`
safely requires auditing every place the script currently relies on tolerating a
nonzero exit, which was deferred until branch 07's CI/test suite could catch a
regression (see the next ADR for that follow-up once it's done). Branch 07 also added `tests/gogh_cli.bats` and
`tests/gogh_regressions.bats` (Bats), plus a `shell-validation` CI job
(`bash -n`, `shellcheck --severity=error` blocking + a full informational report,
`bats tests/`) in `.github/workflows/validate-on-pr.yml`. A `task test` entry
point (`.tasks/commands/test.yml`) mirrors that same check locally.

One real merge conflict occurred (branch 09 vs. the already-merged branch 04, both
touching adjacent lines of the same loop) and was resolved by hand, combining both
sides' changes; a stale comment about the old leading-zero behavior was updated in
the same commit. The three previously-`skip`ped Bats regression tests (waiting on
04/05/09) were then un-skipped in a follow-up commit — which also fixed a bug in
the SIGINT test itself (it backgrounded the process with `&` without `set -m`,
which makes Bash ignore `SIGINT` for async jobs when job control is off, causing a
false negative unrelated to the fix being tested).

## Consequences

- No confirmed command-injection vulnerability was found or introduced; the
  original review explicitly tested for one (unsanitized interactive input into
  `[[ OP -le ARRAYLENGTH ]]`) and ruled it out on Bash 5.2.
- `gogh.sh` no longer trusts a same-named local file over `BASE_URL` when run via
  the documented one-liner; no longer silently reports success on a failed
  download; and Ctrl+C actually stops it.
- Deferred, not done: `set -e` (needs its own audit pass — see the note above),
  and a shellcheck backlog of ~40 pre-existing warning/info/style findings (found
  by branch 07 while calibrating the blocking severity level; visible in CI's
  informational report step, not gated on). Neither blocks anything; both are
  candidates for future incremental branches.
- Also deliberately out of scope (rated "Optional" in the original review, never
  turned into a branch): checksum/signature verification for the
  `sudo wget -O /usr/local/bin/gogh ...` persistent-install path in the README,
  and pinning `BASE_URL` to a release tag/commit instead of always tracking
  `master`.
- The `shell-validation` CI job has only been exercised locally (this sandbox) —
  it triggers on `pull_request`, not on a direct push to `master`, so it has not
  yet run for real on GitHub Actions. Worth confirming via an actual PR.
