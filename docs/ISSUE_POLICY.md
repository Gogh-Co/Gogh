# Issue Lifecycle Policy

This document explains how issues in this repository are triaged and, when
necessary, closed. It reflects the policy adopted in
[#545](https://github.com/Gogh-Co/Gogh/issues/545).

## Issues are not closed just for going quiet

An issue can still be valid even if nobody has commented on it for months —
or years. Automatically closing it makes useful reports harder to discover
and can discourage future contributors from picking them up.

Because of that, regular issues are **never auto-closed for inactivity
alone**. After 365 days without activity, an issue is flagged with the
`needs-confirmation` label. That label is informational only: it does not
close the issue, and any new activity (a comment, a reaction, a linked PR)
removes it automatically.

If you run into the same problem as an older issue, or would like to see a
feature implemented, a 👍 reaction, a comment with more context, or — even
better — a pull request are all welcome, no matter how old the issue is.

## Exception: issues waiting on more information

Issues labeled `Needs More Info` are a special case. If the requested
information from the original reporter never arrives, the issue may be
closed after 45 days of inactivity. This keeps the tracker usable without
leaving unreproducible reports open indefinitely.

## Pull requests

Pull requests follow a separate, stricter policy, since a long-lived PR is
more likely to drift out of sync with the codebase: PRs are marked `stale`
after 120 days of inactivity and closed 30 days after that if nothing
changes.

## About issues previously closed as stale

Before this policy, issues could be automatically closed solely for
inactivity. If you find one of those that is still relevant, feel free to
comment on it or open a new issue that references the original one — we can
reopen useful issues when appropriate.

See [`.github/workflows/stale-bot.yml`](../.github/workflows/stale-bot.yml)
for the exact automation that implements this policy.
