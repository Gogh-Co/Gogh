# 0001. Move most docs into `docs/`, keep `README.md` at root, adopt dual MIT/Apache-2.0 license

- Status: Accepted
- Date: 2026-09-06

## Context

Before commit `a481b74`, `CONTRIBUTING.md`, `CREDITS.md`, and `MENTIONS.md` lived at
the repo root alongside `README.md`, and the project was single-licensed under MIT
(`LICENSE`). The root was getting cluttered with reference material that isn't the
project's entry point, and the license was changed to be dual MIT/Apache-2.0.

## Decision

- Move `CONTRIBUTING.md`, `CREDITS.md`, and `MENTIONS.md` into `docs/`.
- Keep `README.md` at the repo root deliberately — GitHub only renders a repo's
  homepage from a root-level `README.md`, so it cannot move with the rest.
- Update every relative reference to the moved files (`README.md`,
  `tools/README.md`, `.tasks/commands/help.yml`).
- Rename the single `LICENSE` (MIT) to `LICENSE-MIT`, add `LICENSE-APACHE` (Apache
  License 2.0), and add a new root `LICENSE` file that explains the project is
  dual-licensed MIT OR Apache-2.0, at the user's option. Add a matching License
  section to `README.md`.

## Consequences

- Anyone adding a new top-level markdown doc should default to `docs/`, not the repo
  root — `README.md` is the only intentional exception, and that exception is
  permanent (tied to GitHub's rendering behavior, not a stylistic choice).
- Contributors and downstream packagers must now satisfy *either* license, not just
  MIT — any code newly vendored into the project needs to be compatible with being
  redistributed under both.
- References to `CONTRIBUTING.md`/`CREDITS.md`/`MENTIONS.md` from outside the repo
  (external docs, other projects' READMEs) that used the old root paths are now
  stale; no redirect was added for these paths.
