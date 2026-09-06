# Active status

This is the **only** mutable file — it gets rewritten as the project's reality
changes. Unlike `decisions/`, it has no history: it reflects the present. If you're
coming back to this project after a while, this is the first file to read after
`AGENTS.md`.

_Last updated: 2026-09-06._

## In progress / uncommitted

Nothing in progress on `master` right now — `master` is clean and matches
`origin/master`. The 9-branch `gogh.sh` hardening series described in
[ADR 0004](decisions/0004-gogh-sh-installer-hardening-series.md) is fully merged
and pushed. `PLAN_DE_MEJORAS.md` (the working document that tracked it) has been
deleted from the repo root now that ADR 0004 and the merge commits themselves are
the durable record.

This branch itself, `meta/agents-master`, has **not** been pushed to `origin` yet
— it only exists in this local clone. Push it if you want `AGENTS.md`/`memory/`
to survive a fresh clone elsewhere.

**If you're picking this up**: run `git status --short` first — if it no longer
matches what's described above, someone else kept working or committed; trust git,
not this file, and fix this section before continuing.

## Recently verified

All of the following were verified against the fully merged `master` (not just in
isolation on each branch), by direct reproduction in this environment:
- The `bash -c "$(curl ...)"` remote-bootstrap mode no longer lets a same-named
  local file (`apply-colors.sh`, `installs/<theme>.sh`) get executed instead of
  the real one from `BASE_URL`.
- A broken/unroutable `BASE_URL` now makes `gogh.sh` exit non-zero with a clear
  stderr message, instead of silently exiting 0.
- `SIGINT`/`SIGTERM` now actually terminate a running instance (confirmed by
  signaling the real `bash gogh.sh` PID directly — signaling the wrong process in
  a nested shell-wrapper chain gave a false "still running" reading at first;
  worth remembering if this needs re-testing in this same kind of environment).
- `COLUMNS=40` no longer crashes the theme listing with a division-by-zero.
- Zero-padded interactive input (`08`, `008`, `0008`) all parse correctly now
  (needed a second, follow-up fix on top of the first: the array-subscript uses
  of `OP` a few lines below the bounds check also needed the `10#` prefix, not
  just the bounds check itself).
- `set -uo pipefail` (adopted in branch 08) does not break the script's most
  common invocation (interactive mode, zero CLI args) — this took two follow-up
  fixes beyond the branch's original scope (`THEMES[$NUM]` and bare `${OPTION}`
  both being unset-but-referenced under `set -u`), found by actually exercising
  that path rather than just the `-h`/`<theme>` paths the branch was scoped to.
- `bats tests/` — 8/8 passing, run twice to check for flakiness.
- `shellcheck --severity=error gogh.sh apply-colors.sh` — clean.
- `task test` — works end to end (`task:syntax` + `task:shellcheck` + `task:bats`).

## Open / pending ideas

- **`set -e` not yet adopted.** Branch 08 deliberately stopped at
  `set -uo pipefail`; enabling `-e` too needs an audit of every place the script
  currently relies on tolerating a nonzero exit (several exist, e.g. the
  `command -v X > /dev/null && X` pattern used for the optional `bar::*`
  functions). Now that the Bats suite from branch 07 exists as a safety net, this
  is unblocked — next session's likely next step.
- **Real CI never exercised.** `.github/workflows/validate-on-pr.yml`'s new
  `shell-validation` job triggers on `pull_request`, not on a push to `master` —
  since the whole series was merged and pushed directly, that job has never
  actually run on GitHub Actions. Worth confirming via a real PR.
- **ShellCheck backlog.** The full (non-`--severity=error`) shellcheck report
  surfaces ~40 pre-existing warning/info/style findings (SC2086, SC2046, SC2207,
  SC2155, SC2034, SC2059, SC2223, SC2129, SC2005, SC2154, SC2188, SC2269) across
  `gogh.sh`/`apply-colors.sh`. Visible in CI's informational (non-blocking) step;
  nobody has triaged them yet.
- **Deliberately out of scope** (rated "Optional" in the original review, no
  branch planned): checksum/signature verification for the persistent
  `sudo wget -O /usr/local/bin/gogh ...` install path documented in the README;
  pinning `BASE_URL` to a release tag/commit instead of always tracking `master`.
- `docs/CONTRIBUTING.md` / `.tasks/commands/help.yml` document the
  add-a-theme contributor flow, not the "I'm touching `gogh.sh`" flow — neither
  mentions `task test`. Minor discoverability gap, not urgent.
