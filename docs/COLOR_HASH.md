# Color Hash

Every theme in `themes.json` carries two SHA-256 fields, so palette and background can be compared independently:

- `hash` — the theme's **16 ANSI colors only**, independent of `name`, `author`, `variant`, `background`, `foreground`, or `cursor` (those are cosmetic).
- `hash_bg` — the theme's `background` value only.

**How they're computed** (`tools/lib/theme_common.py`, used by `tools/generate/01_generate_themes_json.py`):

- `hash`: concatenate `color_01` → `color_16` hex values as-is, no separators, then SHA-256 the result.
- `hash_bg`: SHA-256 of the `background` hex value on its own.

Example — `Solarized Dark.yml`:

```
#002831#D11C24#738A05#A57706#2176C7#C61C6F#259286#EAE3CB#001E27#BD3613#475B62#536870#708284#5956BA#819090#FCF4DC
↓ SHA-256 → hash
56c19575cf17b9adb71130dbf58b45d36ef250ace147115edfe61b126166f489

#001E27
↓ SHA-256 → hash_bg
70c870089f3b222d01ae3f98d86dc53e11cb7f4cde69ecfe1f1a90a541811b2e
```

`hash` only changes if one of the 16 palette colors changes — background/cursor/foreground and metadata edits don't touch it. `hash_bg` only changes if the background changes. Two themes sharing both hashes are true duplicates; sharing only `hash` means same palette, different background.
