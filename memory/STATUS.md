# Active status

This is the **only** mutable file — it gets rewritten as the project's reality
changes. Unlike `decisions/`, it has no history: it reflects the present. If you're
coming back to this project after a while, this is the first file to read after
`AGENTS.md`.

_Last updated: 2026-09-06._

## In progress / uncommitted

- `PLAN_DE_MEJORAS.md` (repo root, **untracked**): a prioritized hardening plan for
  `gogh.sh` produced by a security/correctness review of the installer (covers the
  README-documented `bash -c "$(curl|wget ...)"` one-liner, `apply-colors.sh`,
  `apply-alacritty.py`, `apply-terminator.py`, and CI). Nothing in it has been
  implemented yet — no code has changed as a result of the review, only the plan
  document itself exists. Priority order (highest first):
  1. Remove the `eval` of the third-party `phenonymous/shell-progressbar` script
     (blocking — explicitly requested first).
  2. Make the Tilix confirmation prompt respect `GOGH_NONINTERACTIVE`.
  3. Fix `SCRIPT_PATH` detection so it stops resolving to the CWD under
     `bash -c "$(curl ...)"` (can cause a locally-present file to be executed
     instead of the real remote one).
  4. Harden downloads: timeouts, `curl`/`wget` availability checks, real exit-status
     propagation instead of the hardcoded final success.
  5. Fix signal handling — Ctrl+C currently runs cleanup but does not terminate the
     script (verified: process still alive 3s+ after `SIGINT`).
  6. Separate `stdout` (results) from `stderr` (diagnostics).
  7. Add Bash-specific CI (`bash -n`, shellcheck, Bats) — **does not exist today**.
  8. Adopt `set -euo pipefail`, but only after #7's test suite exists (audit-first).
  9. Minor fixes: division-by-zero on narrow terminals, incomplete leading-zero
     handling, missing backup in `apply-alacritty.py` before overwriting config.

  See the file itself for full evidence/repro commands per item.

- `memory/` (this ADR/STATUS setup) and a new root `AGENTS.md` are being created in
  this same session — not yet committed.

**Note on the docs/ convention:** [ADR 0001](decisions/0001-docs-reorg-and-dual-license.md)
(the commit right before this session) established that new top-level markdown docs
should go in `docs/`, not the repo root — `README.md` is the only intentional
exception. `PLAN_DE_MEJORAS.md` currently sits at the root, which is inconsistent
with that convention. It was left in place rather than moved automatically; decide
where it belongs (root, `docs/`, or delete once its items are tracked elsewhere)
before committing.

**If you're picking this up**: run `git status --short` first — if it no longer
matches what's described above, someone else kept working or committed; trust git,
not this file, and fix this section before continuing.

## Recently verified

No automated test suite exists for `gogh.sh` (see plan item #7 above). During the
review that produced `PLAN_DE_MEJORAS.md`, the following were manually verified by
direct reproduction against Bash 5.2.21 in this environment (not via an automated
suite):
- `BASH_SOURCE[0]` is empty under `bash -c "..."`, causing `SCRIPT_PATH` to resolve
  to the CWD.
- A failed `wget -qO-` download yields an empty string, which `bash -c ""` executes
  as a no-op with exit code 0 (false success).
- `SIGINT` runs `GLOBAL_VAR_CLEANUP` but does not terminate the script — it stays
  alive, blocked back at the read prompt.
- `COLUMNS=40` crashes the theme-listing renderer with a division-by-zero.
- Unsanitized interactive input flowing into `[[ OP -le ARRAYLENGTH ]]` does **not**
  allow command injection on Bash 5.2 (tested and ruled out, not just assumed).

## Open / pending ideas

- Everything in `PLAN_DE_MEJORAS.md` is, by definition, an open idea — none of it is
  implemented. Treat that file as the working backlog until items are done, at which
  point closing them out (and eventually deleting or archiving the file) would be a
  good time to also decide whether any of those fixes deserve their own ADR (e.g. the
  `SCRIPT_PATH` local-vs-remote fix is architecturally significant enough to
  potentially warrant one once implemented).
- Where `PLAN_DE_MEJORAS.md` itself should live long-term (root vs. `docs/`) is
  unresolved — see the note above.
