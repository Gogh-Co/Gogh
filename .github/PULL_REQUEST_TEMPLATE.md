<!--
Fill in the section that matches your PR and delete the other one.

Adding or editing a theme?
- Title must start with `theme:` (e.g. `theme: Add Solarized Midnight`)
- Only files under `themes/` should change — everything else (data/, tools output,
  installs/, gogh.sh) is generated automatically by CI after merge
- All hex color values must be uppercase (`#FF0000`, not `#ff0000`)

Changing code, tooling, CI or docs instead?
- Use a descriptive title that does NOT start with `theme:`
  (e.g. `fix(kitty): create kitty.conf when missing`)
- Don't commit generated output: data/, installs/, tools/run.txt or the
  THEMES array in gogh.sh — CI regenerates them after merge
- Run `task test` before opening the PR (bash -n, ShellCheck and the Bats suite)

These are checked automatically by the "✅ - Validate PR" workflow.
-->

## 🎨 Theme PR

### What does this PR do?

### Checklist

- [ ] PR title starts with `theme:`
- [ ] Only files under `themes/` were changed
- [ ] All hex colors are uppercase

## 🛠️ Code / maintenance PR

### What does this PR change, and why?

<!-- Link the related issue, if any: Fixes #123 -->

### How was it tested?

### Checklist

- [ ] PR title does not start with `theme:`
- [ ] No generated output changed (`data/`, `installs/`, `tools/run.txt`, the THEMES array in `gogh.sh`)
- [ ] `task test` passes (bash -n, ShellCheck, Bats)
