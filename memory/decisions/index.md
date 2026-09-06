# Architecture Decision Records (ADR)

One file per decision, numbered in creation order. Once accepted, an ADR is **never
edited** — if the decision changes, write a new ADR that references the old one and
mark the old one `Superseded by 000X` in the table below. This is deliberate: an
ADR's value is being the exact snapshot of what was decided and why at that moment,
not a living document (that's what `../STATUS.md` is for).

Before touching something a decision already covers, read it first — avoid reopening
a trade-off that was already discussed and explicitly accepted.

| # | Title | Status |
|---|-------|--------|
| [0001](0001-docs-reorg-and-dual-license.md) | Move most docs into `docs/`, keep `README.md` at root, adopt dual MIT/Apache-2.0 license | Accepted |
| [0002](0002-gogh-website-install-domain.md) | Use `gogh.website` as the stable install-bootstrapper domain, replacing the retired `git.io` shortlink | Accepted |
| [0003](0003-gh-pages-workflow-call.md) | Make the gh-pages deploy workflow callable via `workflow_call` instead of duplicating it per branch | Accepted |
