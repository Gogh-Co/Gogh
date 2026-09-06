# 0008. Rewrite the stale-bot policy per issue #545

- Status: Accepted
- Date: 2026-09-06

## Context

The maintainer opened [issue #545](https://github.com/Gogh-Co/Gogh/issues/545)
("Changing our stale issue policy 🙋") to stop automatically closing issues
for inactivity alone — an issue can still be valid after months or years of
silence, and auto-closing made useful reports harder to discover and could
discourage future contributors. The issue's accepted comment specifies the
concrete replacement policy:

- Regular issues: flagged (not closed) after 365 days of inactivity; new
  activity clears the flag.
- Issues labeled "Needs More Info": may still be closed after 45 days if the
  requested information never arrives.
- Pull requests: marked stale after 120 days, closed after 30 more days of
  continued inactivity.

The previous `.github/workflows/stale-bot.yml` used a single
`actions/stale@v10` step with one shared 30-day-stale/30-day-close threshold
for both issues and PRs, and a broad `exempt-issue-labels` list that exempted
most common issue labels (bug, enhancement, question, etc.) from ever going
stale at all — a leftover from when the policy was aggressive enough that
blanket exemptions made sense.

## Decision

Replaced the single step with two `actions/stale@v10` steps in the same job:

1. **Regular issues + PRs** in one step, using the action's independent
   issue/PR thresholds: `days-before-issue-stale: 365`,
   `days-before-issue-close: -1` (never auto-close), labeling with a new
   `needs-confirmation` label (created in the repo as a prerequisite — it
   didn't exist before); `days-before-pr-stale: 120`,
   `days-before-pr-close: 30`, keeping the existing `stale` PR label. This
   step exempts `Needs More Info` (handled by step 2 instead) and narrowed the
   old blanket exemption list down to `wontfix,duplicate,inactive` for
   issues — the 365-day nudge is meant to apply broadly, not just to a
   narrow subset of issue types.
2. **`Needs More Info` issues only** (`only-issue-labels: "Needs More Info"`),
   `days-before-issue-stale: 45`, `days-before-issue-close: 0` (close
   immediately once the 45-day mark is hit), `close-issue-reason:
   "not_planned"`. PR processing disabled entirely in this step
   (`days-before-pr-stale: -1`) since step 1 already covers PRs.

`remove-stale-when-updated` (default `true` in the action) already satisfies
"new activity removes the flag" without extra config.

Verified with `debug-only: true` on a disposable branch dispatched via
`gh workflow run --ref`, not just by reading the YAML: the run succeeded,
confirmed "Executing in debug mode!" (nothing was actually labeled/closed),
and processed the 7 currently-open issues/PRs without error — none old
enough yet to trigger either threshold. Branch deleted after.

## Consequences

- No issue will ever be auto-closed for inactivity alone again; the harshest
  automatic outcome for a regular issue is an informational label.
- The `needs-confirmation` label now exists in the repo and is
  stale-bot-specific — a human relabeling/removing it manually should expect
  the bot to reapply it if the issue goes another 365 days without activity
  (standard `actions/stale` behavior, not special-cased here).
- The old aggressive 30-day exemption list is gone for issues; if a
  currently-unlisted label later turns out to need exempting from the
  365-day flag (e.g. a "planned"/"tracking" style label), that's a follow-up
  edit to `exempt-issue-labels`, not a reason to revisit this ADR.
