# Active status

This is the **only** mutable file — it gets rewritten as the project's reality
changes. Unlike `decisions/`, it has no history: it reflects the present. If you're
coming back to this project after a while, this is the first file to read after
`AGENTS.md`.

_Last updated: 2026-09-06._

## In progress / uncommitted

`README.md` on `master` has an **uncommitted, stashed** change (`git stash list` —
message "wip: README simplification (remove persistent install, keep 2
traditional methods)") implementing [ADR 0006](decisions/0006-remove-persistent-cli-install-from-readme.md).
It was stashed (not committed) only so this branch, `meta/agents-master`, could
be checked out in the same working directory to add that ADR; nothing about the
edit itself is unfinished. **Pop it back (`git stash pop`) after switching back
to `master`.**

Otherwise `master` is clean and matches `origin/master` (`dba7481`). Fully
landed and pushed since the 9-branch series (ADR 0004):
- `set -e` adoption (ADR 0005).
- The full ShellCheck backlog (all 12 remaining finding types, ~52 occurrences)
  — `shellcheck gogh.sh apply-colors.sh` is now clean at every severity, not
  just `--severity=error`.

This branch itself, `meta/agents-master`, **is** pushed to `origin` (as of the
ADR 0004/0005 commit).

**If you're picking this up**: run `git status --short` first — if it no longer
matches what's described above, someone else kept working or committed; trust git,
not this file, and fix this section before continuing.

## Recently verified

Everything from earlier entries (the 9-branch series, `set -e`, all against the
fully merged `master`) still holds. Additionally, for the ShellCheck backlog
cleanup:
- `shellcheck gogh.sh apply-colors.sh` — exit 0, zero findings at any severity.
- `bats tests/` — 8/8, run twice.
- `task test` end to end.
- One near-miss caught by a byte-level check, not just re-running tests: an
  attempted fix to `apply-colors.sh`'s Wezterm palette-escape-sequence builder
  (`printf '%s'` instead of the variable-as-format pattern) looked correct but
  silently broke the `\033`/`\007` escape-sequence generation (`printf '%s'`
  doesn't reinterpret backslash escapes in its arguments, only in the format
  string). Caught by comparing `xxd` output before/after, reverted, and
  documented/suppressed instead. Worth remembering: when "fixing" a printf
  format-string warning, diff the actual output bytes, not just re-running
  `bash -n`/tests, if the string being printed contains escape sequences.
- Terminal-specific functions touched during that cleanup (Kitty, Konsole,
  XFCE4-terminal, GTK/dconf profiles in `apply-colors.sh`) were verified by
  syntax + static analysis + manual reasoning about each changed expression,
  **not** end-to-end against a real desktop terminal — this sandbox has none of
  those environments. If something in that area misbehaves later, re-check
  those specific diffs first.

## Open / pending ideas

- **Real CI never exercised.** `.github/workflows/validate-on-pr.yml`'s
  `shell-validation` job triggers on `pull_request`, not on a push to `master` —
  since the whole series was merged/committed directly, that job has never
  actually run on GitHub Actions. Worth confirming via a real PR.
- **Real CLI-binary support, deliberately not attempted.** ADR 0006 removed the
  ad hoc persistent-install path (`sudo wget -O /usr/local/bin/gogh ...`,
  unverified) from the README rather than hardening it, on the understanding
  that a *real* CLI binary — versioned releases, checksums/signatures, a real
  `--version`/`--help`, an update/uninstall story, maybe package-manager
  distribution — is a legitimate future direction but a substantially different
  (packaging + release infrastructure) effort, not a README tweak. If someone
  picks this up, it deserves its own ADR, not a revival of 0006.
- `docs/CONTRIBUTING.md` / `.tasks/commands/help.yml` document the
  add-a-theme contributor flow, not the "I'm touching `gogh.sh`" flow — neither
  mentions `task test`. Minor discoverability gap, not urgent.
