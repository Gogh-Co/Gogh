# Active status

This is the **only** mutable file — it gets rewritten as the project's reality
changes. Unlike `decisions/`, it has no history: it reflects the present. If you're
coming back to this project after a while, this is the first file to read after
`AGENTS.md`.

_Last updated: 2026-09-06._

## In progress / uncommitted

Nothing in progress. `master` is clean and matches `origin/master`
(`6197eb9`). This branch, `meta/agents-master`, is also pushed and matches
`origin/meta/agents-master`.

Everything that came out of the original security/correctness review of
`gogh.sh` (the plan tracked in the now-deleted `PLAN_DE_MEJORAS.md`) is
resolved and landed — see [ADR 0004](decisions/0004-gogh-sh-installer-hardening-series.md)
through [0007](decisions/0007-pin-shellcheck-version-in-ci.md). Unrelated
maintainer-driven work also landed since: the stale-bot policy rewrite
([ADR 0008](decisions/0008-rewrite-stale-bot-policy.md)) and a small
`docs/CONTRIBUTING.md`/`task help` pointer to `task test` for installer
changes.

**If you're picking this up**: run `git status --short` first — if it no longer
matches what's described above, someone else kept working or committed; trust git,
not this file, and fix this section before continuing.

## Recently verified

- `shellcheck gogh.sh apply-colors.sh` — exit 0 at every severity, pinned to
  the exact ShellCheck version CI now uses (v0.11.0), verified in a clean
  container with no ShellCheck preinstalled (not just this dev machine's
  install). See ADR 0007 for why that distinction mattered.
- `bats tests/` — 8/8, run repeatedly across sessions.
- `task test` end to end.
- The rewritten `stale-bot.yml` was dry-run for real on GitHub Actions
  (`debug-only: true`, dispatched from a disposable branch, deleted after):
  ran clean, no errors, processed all 7 currently-open issues/PRs without
  incorrectly flagging/closing anything (none are old enough yet to trigger
  either the 365-day or 45-day thresholds).
- `task help`'s rendered output (ANSI codes and all) was checked directly,
  not just the YAML/heredoc source, after adding the `task test` pointer.

## Open / pending ideas

- **Real CLI-binary support, deliberately not attempted.** ADR 0006 removed
  the ad hoc persistent-install path from the README rather than hardening
  it, on the understanding that a *real* CLI binary — versioned releases,
  checksums/signatures, a real `--version`/`--help`, an update/uninstall
  story, maybe package-manager distribution — is a legitimate future
  direction but a substantially different (packaging + release
  infrastructure) effort. If someone picks this up, it deserves its own ADR.
- `shell-validation`'s YAML orchestration (as opposed to the individual
  commands it runs, which are verified above) has still never been executed
  by GitHub Actions itself via an actual `pull_request` event — every merge
  so far has gone directly to `master`. Not treated as a live risk (every
  command in it has been verified with the exact pinned tool versions), just
  noted in case something about the trigger/permissions context itself
  (as opposed to the commands) ever needs debugging.
