# Active status

This is the **only** mutable file — it gets rewritten as the project's reality
changes. Unlike `decisions/`, it has no history: it reflects the present. If you're
coming back to this project after a while, this is the first file to read after
`AGENTS.md`.

_Last updated: 2026-09-06._

## In progress / uncommitted

`gogh.sh` on `master` has an **uncommitted, stashed** change (`git stash list` —
message "wip: set -euo pipefail audit fixes on gogh.sh") adopting `set -e` per
[ADR 0005](decisions/0005-adopt-set-e-in-gogh-sh.md) — the last item
that was still open in this file. It was stashed (not committed) only so this
branch, `meta/agents-master`, could be checked out in the same working directory
to update this file and add the ADR; nothing about the fix itself is unfinished.
**Pop it back (`git stash pop`) after switching back to `master`.**

Otherwise `master` is clean and matches `origin/master`. The 9-branch `gogh.sh`
hardening series (ADR 0004) is fully merged and pushed.

This branch itself, `meta/agents-master`, has **not** been pushed to `origin` yet
— it only exists in this local clone. Push it if you want `AGENTS.md`/`memory/`
to survive a fresh clone elsewhere.

**If you're picking this up**: run `git status --short` first — if it no longer
matches what's described above, someone else kept working or committed; trust git,
not this file, and fix this section before continuing.

## Recently verified

Everything from the previous entry (the 9-branch series, all against the fully
merged `master`) still holds. Additionally, for the `set -e` adoption (ADR 0005):
- `bats tests/` — 8/8 passing, run twice, against the patched (uncommitted)
  `gogh.sh`.
- `shellcheck --severity=error` — still clean.
- Direct reproduction of every scenario the audit flagged (minimal/empty
  environment with `TERM=dumb`, zero-padded input `8`/`08`/`008`/`0008`,
  `COLUMNS=40`, a deliberately broken `BASE_URL`, `-h`, a real theme name) all
  behave the same as before adopting `-e` — no new failures introduced.
- `TERM=dumb` specifically was the scenario that caught the biggest issue: `tput
  setaf`/`tput sgr0`/`tput clear` all exit non-zero on a terminal without color
  support, which would have aborted the script on its very first line under a
  naive `set -e`. Worth remembering as *the* environment to always retest against
  when touching the top of this file.

## Open / pending ideas

- **Real CI never exercised.** `.github/workflows/validate-on-pr.yml`'s
  `shell-validation` job triggers on `pull_request`, not on a push to `master` —
  since the whole series (including the `set -e` follow-up) was merged/committed
  directly, that job has never actually run on GitHub Actions. Worth confirming
  via a real PR.
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
