# 0006. Remove the persistent `/usr/local/bin/gogh` install from the README

- Status: Accepted
- Date: 2026-09-06

## Context

The README's "As command line" section documented a third install path beyond
the two traditional ones (interactive one-liner, and clone/non-interactive
mode):

```bash
sudo wget -O /usr/local/bin/gogh https://gogh.website/gogh && sudo chmod +x /usr/local/bin/gogh
```

This downloads `gogh.sh` and saves it **permanently, with root-owned
permissions, in the system-wide `PATH`** (`/usr/local/bin`), with **no
integrity verification of any kind** — no checksum, no signature. The README
already flagged it with "WARNING: Only if you know what you are doing or trust
me :)", which is itself a signal that even the maintainers considered it the
riskiest of the three documented paths. The original security review rated
"add checksum/signature verification for this path" as an Optional
hardening item (see [ADR 0004](0004-gogh-sh-installer-hardening-series.md)'s
consequences) — never built, since it needs release infrastructure
(maintainer-side checksum publishing) beyond just editing `gogh.sh`.

On discussing that Optional item, the maintainer's observation was that this
"CLI install" path is mechanically the *same* one-liner as the interactive
Install method — the only difference is that it's saved to disk once instead
of re-fetched and discarded each run — and that the two traditional methods
(interactive one-liner via `bash -c "$(curl|wget ...)"`, and clone-then-run)
already cover the same real use case: cloning the repo already gives a
persistent local copy a user can re-run (`./gogh.sh Dracula`) without
re-downloading, with the added benefit of `git`'s own integrity/versioning
(pin a commit, verify signed tags, `git pull` to update) — something the bare
`wget`+`chmod` pattern never offered.

## Decision

Remove the "As command line" section from `README.md` entirely, rather than
hardening it with a checksum step. Its two useful pieces were preserved,
relocated to make sense without the removed persistent-binary assumption:

- The CLI-arguments demonstration (`gogh Dracula`, `gogh ALL`) became a new
  "CLI Arguments (skip the interactive menu)" subsection directly under
  **Install**, rewritten to use `./gogh.sh Dracula` / `./gogh.sh ALL` (a local
  script invocation, not a persistent PATH command).
- The one-line-remote-plus-arguments example
  (`bash -c "$(wget -qO- https://gogh.website/gogh)" -- Dracula`) was kept
  as-is in that same new subsection — it's still the same interactive
  one-liner mechanism, just demonstrating the `--` argument-passing trick.

The corresponding Table of Contents entry was removed; nothing else pointed
to that anchor.

## Consequences

- The README now documents exactly two install mechanisms (interactive
  one-liner, and clone/non-interactive), both already covered by the existing
  hardening work (ADR 0004/0005) and both leaving no persistent root-owned
  artifact behind unless the user explicitly clones the repo themselves.
- The Optional "add checksum verification for the persistent install" item
  from ADR 0004 is now moot for the README-documented flow — there's no
  persistent install left to verify. It could still resurface if a real CLI
  binary happens (see below), but that would be a new decision, not a revival
  of this one.
- **This is a simplification, not a rejection of the idea of a real CLI
  binary.** The explicit intent going into this decision is that *if* Gogh
  ever gets proper CLI-binary support, it should be done right — with the
  things a real installed CLI needs and today's `wget`+`chmod` shortcut never
  had: released, checksummed/signed artifacts; a real version string
  (`gogh --version`); real `--help`/usage output as a first-class command
  (not just `gogh.sh`'s own `-h`); a documented update/uninstall path; possibly
  distribution via an actual package manager. That is a substantial, separate
  effort (packaging + release infrastructure), not a README edit — if/when
  someone picks it up, it deserves its own ADR rather than being folded back
  into this one.
