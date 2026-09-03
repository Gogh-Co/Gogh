# Tools

Scripts are grouped by which GitHub Actions workflow runs them. The folder
name and the workflow filename share the same prefix on purpose:

| Folder | Workflow(s) | Trigger |
|---|---|---|
| [`generate/`](#generate) | `generate-on-push.yml`, `generate-manual.yml` | push to `themes/**`, or manual dispatch |
| [`validate/`](#validate) | `validate-on-pr.yml` | pull request touching `themes/**` |
| [`lib/`](#lib) | — (imported by the two above, not run directly) | — |
| [`legacy/`](#legacy) | — (not run by any workflow) | — |

## `generate/`

A strict, ordered pipeline — each step reads what the previous one wrote, so
the filename prefix (`01`..`10`) **is** the execution order. Run from the
repo root:

1. `01_generate_themes_json.py` — reads `themes/*.yml` → writes `data/themes.json` and `data/themes-min.json` (adds the `hash`/`hash_bg` fields).
2. `02_split_themes_json.py` — `data/themes.json` → one file per theme in `data/json/`.
3. `03_split_themes_txt.py` — `data/themes.json` → one 16-line ANSI palette per theme in `data/txt/`.
4. `04_generate_themes_csv.py` — `data/themes.json` → `data/themes.csv`.
5. `05_generate_themes_yaml.py` — `data/themes.json` → `data/themes.yaml`.
6. `06_split_themes_yaml.py` — `data/themes.json` → one file per theme in `data/yaml/`.
7. `07_generate_install_scripts.py` — reads `themes/*.yml` directly (not `data/themes.json`) → one install script per theme in `installs/`.
8. `08_update_gogh_sh_theme_list.py` — `data/themes.json` → refreshes the `THEMES` array in `gogh.sh`.
9. `09_write_run_timestamp.py` — writes the pipeline run time to `tools/run.txt`.
10. `10_generate_wcag_report.js` — `data/themes.json` → `data/wcag.json` and `data/wcag-min.json` (run with Deno: `deno run --allow-all tools/generate/10_generate_wcag_report.js`).

This exact sequence is what CI runs on every push to `themes/**`
(`.github/workflows/generate-on-push.yml`), after which it tags a release and
commits the regenerated output back to `master`. `generate-manual.yml` runs
the same steps on demand (`workflow_dispatch`), without the release/commit
steps.

Steps 1-9 are plain scripts, executed directly (`python tools/generate/NN_....py`) —
not imported as a package — so numeric prefixes are fine even though they're
not valid Python module names.

**Known inconsistency, left as-is on purpose:** steps 2, 3 and 6 slug a theme
name to a filename via `lib.theme_common.slugify_theme_name()` (with a
`-1`, `-2`... suffix on collision). Steps 7 and 8 predate that helper and use
their own, slightly different slug logic with no collision suffix — see the
`NOTE` comment at the top of each file. Unifying them would change public
install-script filenames and `gogh.sh`'s `THEMES` list, so it's deliberately
out of scope here.

## `validate/`

Two independent checks, run in CI on every PR that touches `themes/**`
(`.github/workflows/validate-on-pr.yml`). Order between them doesn't matter,
so — unlike `generate/` — they're not numbered:

- `validate_colors.py` — every theme's hex color values must be uppercase.
- `validate_pr.py` — the PR title must start with `theme:` and every changed file must live under `themes/`.

## `lib/`

- `theme_common.py` — shared by both `generate/` and `validate/`: the SHA-256
  hashing used for `hash`/`hash_bg`, the canonical theme field order
  (`build_ordered_theme`), and the theme-name-to-filename slug logic
  (`slugify_theme_name`, `unique_path`) used by the per-theme file generators.

Scripts in `generate/` and `validate/` import it with a small `sys.path`
shim at the top of each file (`sys.path.insert(0, .../tools)` then
`from lib.theme_common import ...`), since they're executed directly rather
than as part of a Python package.

## `legacy/`

Not invoked by any workflow, kept for reference only:

- `fortmat.py` — converts old-format YAML themes from `themes_old/` (that
  directory no longer exists in this repo, so this script can't currently run).
- `generate.sh` — legacy shell generator from before the Python/JS pipeline;
  expects the old `themes/*.sh` format and a `gh-pages/` output path, neither
  of which matches the current `themes/*.yml` + `data/` layout.

## Other files

- `run.txt` — output of `09_write_run_timestamp.py`, not a script.
