# 0002. Use `gogh.website` as the stable install-bootstrapper domain, replacing the retired `git.io` shortlink

- Status: Accepted
- Date: 2026-09-04

## Context

The README's documented one-liner installs (`bash -c "$(curl -fsSL ...)"` /
`bash -c "$(wget -qO- ...)"`), the CLI-install `wget` line, and the args example all
previously pointed at the `git.io/vQgMr` shortlink. `git.io` was retired, breaking (or
threatening to break) every documented install command at once — see commit
`b6fea81`.

## Decision

Replace every occurrence of the `git.io/vQgMr` shortlink in `README.md` with
`https://gogh.website/gogh`, a domain the project controls (served via GitHub Pages —
see [0003](0003-gh-pages-workflow-call.md)) that forwards to `gogh.sh` on
`Gogh-Co/Gogh@master`. `Mayccoll/Gogh` mentions in `MENTIONS.md` were deliberately
left untouched, since those document historical references to the project's
pre-2023 name rather than install instructions.

## Consequences

- The project now depends on `gogh.website`'s DNS registration and GitHub Pages
  hosting staying correctly configured — a lapsed domain or broken Pages deploy
  breaks every documented install command project-wide, the same single-point-of-
  failure risk the old `git.io` shortlink had, just under the project's own control
  this time instead of a third-party shortener's.
- `gogh.website/gogh` is a redirect/forwarding layer, not the content itself — the
  actual trust boundary for what gets executed is still `Gogh-Co/Gogh@master` via
  `raw.githubusercontent.com`. Changing what `gogh.website/gogh` forwards to (or
  pointing it at a different ref) is a decision that would need its own ADR, since
  every documented install command depends on where it currently points.
- If `gogh.website` is ever deprecated, every place that currently references
  `git.io/vQgMr` history has already been fully migrated — there is no remaining
  fallback path to the old shortlink to worry about.
