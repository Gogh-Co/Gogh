# 0007. Pin ShellCheck to an explicit version in CI instead of the runner's default

- Status: Accepted
- Date: 2026-09-06

## Context

After landing ADR 0004/0005's hardening series, `.github/workflows/validate-on-pr.yml`'s
`shell-validation` job relied on ShellCheck being whatever version the
`ubuntu-22.04` GitHub-hosted runner happened to preinstall, on the documented
assumption (from `actions/runner-images`) that this was fixed and known.

That assumption was tested directly rather than trusted: using `act` (local
GitHub Actions runner) plus a `catthehacker/ubuntu:act-22.04` container with
ShellCheck explicitly installed at the runner's actual pinned version
(0.8.0-2) surfaced 4 real findings — an unquoted `${BASE_DIR%:}` expansion in
`apply-colors.sh`, and three `[ ! -z "$VAR" ]` checks — that this session's
own dev-machine ShellCheck (0.11.0, the actual latest release, confirmed via
GitHub's releases API) did **not** report by default.

Investigating why surfaced the real mechanism: it isn't that 0.11.0 is worse
at detection. Both of the missed checks (`SC2236`/"use -n instead of ! -z",
and the unquoted-expansion case, which resurfaces as `SC2248` in 0.11.0) still
exist in the newer version — they were deliberately demoted from
default-enabled to opt-in (`--enable=<name>` / `--enable=all`) between
versions, as ShellCheck's maintainers tuned default output toward
higher-confidence issues. So "the newer tool caught less by default" was real,
but not a regression — it reflects a deliberate change in what ShellCheck
considers default-worthy, not a loss of capability.

## Decision

Fixed the 4 findings (they're valid either way). Then, rather than continuing
to rely on "whatever the runner preinstalls" (which is itself unpinned and can
change whenever GitHub updates the runner image, independent of any change to
this repo), added an explicit `SHELLCHECK_VERSION: v0.11.0` workflow-level env
var and a step that downloads that exact release directly from
`koalaman/shellcheck`'s GitHub releases, instead of using the OS package.
Checked default (non-`--enable=all`) behavior only — not attempting to also
adopt the newly-optional checks project-wide, since that wasn't the ask.

Verified end-to-end (not just "should work"): a clean container with no
ShellCheck preinstalled, running the workflow's exact download+install+check
commands, confirms `gogh.sh`/`apply-colors.sh` are clean against the pinned
0.11.0 at its default strictness.

## Consequences

- ShellCheck's actual analysis is now reproducible across CI runs regardless
  of what GitHub ships in the runner image next.
- Upgrading ShellCheck is now a deliberate decision: bump
  `SHELLCHECK_VERSION`, run `task test` locally, fix whatever the new version
  newly flags (by default or via `--enable`), then commit the bump — not
  something that changes silently.
- This pattern (pin the actual tool version being exercised, verify with it
  directly rather than trusting an assumption about the runner image) is
  worth applying to Bats too if a similar surprise ever comes up there; not
  done proactively here since nothing indicated a problem.
