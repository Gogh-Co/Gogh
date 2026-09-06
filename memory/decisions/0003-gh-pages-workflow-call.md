# 0003. Make the gh-pages deploy workflow callable via `workflow_call` instead of duplicating it per branch

- Status: Accepted
- Date: 2026-09-03 (approximate — see commit `b1fd1e0`)

## Context

`gogh.website` (see [0002](0002-gogh-website-install-domain.md)) and the themes
website are built from the `main/website` branch and deployed via GitHub Pages. A
branch that wants to deploy on push needs its own workflow file, because GitHub only
reads workflow files from the ref that received the push — but the actual
build/deploy steps for `gh-pages.yml` are the same regardless of which branch
triggers them.

## Decision

Add `workflow_call` as a trigger on `.github/workflows/gh-pages.yml`, so a thin
push-triggered stub workflow living on `main/website`
(`main/website:.github/workflows/deploy-on-push.yml`) can invoke this one by
reference (`uses: Gogh-Co/Gogh/.github/workflows/gh-pages.yml@master`) instead of
duplicating the whole build/checkout/deploy pipeline in a second file.

## Consequences

- The actual build/deploy logic has one home (`gh-pages.yml` on `master`); a change
  to how the site is built only needs to happen in one place.
- The stub workflow on `main/website` must stay minimal (just the push trigger plus
  the `uses:` reference) — if someone adds real build steps there instead of in
  `gh-pages.yml`, the two branches' deploys will silently drift apart.
- `gh-pages.yml` now has four possible triggers (`workflow_dispatch`, `release`,
  `workflow_run` off "Run Generators", and `workflow_call`); the `if:` guard on the
  `build` job (`github.event_name != 'workflow_run' || ...conclusion == 'success'`)
  exists specifically to stop a failed generator run from triggering a deploy — this
  guard must be kept in sync if more trigger types are added later.
