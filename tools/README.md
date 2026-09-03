# Tools

| Folder | Files | Run with |
|---|---|---|
| [`generate/`](#generate) | `01_generate_themes_json.py` … `10_generate_wcag_report.js` | `./tools/generate-run_local.sh`, or CI (`generate-on-push.yml`, `generate-manual.yml`) |
| [`validate/`](#validate) | `validate_colors.py`, `validate_pr.py` | CI only (`validate-on-pr.yml`) |
| [`lib/`](#lib) | `theme_common.py` | imported, not run directly |
| [`legacy/`](#legacy) | `fortmat.py`, `generate.sh` | not run by anything |
| [`git-hooks/`](#git-hooks) | `pre-commit` | `git commit`, once enabled |

## `generate/`

Run in this order — the number prefix is the order:

| # | File | Reads | Writes |
|---|---|---|---|
| 1 | `01_generate_themes_json.py` | `themes/*.yml` | `data/themes.json`, `data/themes-min.json` |
| 2 | `02_split_themes_json.py` | `data/themes.json` | `data/json/<theme>.json` |
| 3 | `03_split_themes_txt.py` | `data/themes.json` | `data/txt/<theme>.txt` |
| 4 | `04_generate_themes_csv.py` | `data/themes.json` | `data/themes.csv` |
| 5 | `05_generate_themes_yaml.py` | `data/themes.json` | `data/themes.yaml` |
| 6 | `06_split_themes_yaml.py` | `data/themes.json` | `data/yaml/<theme>.yaml` |
| 7 | `07_generate_install_scripts.py` | `themes/*.yml` | `installs/<theme>.sh` |
| 8 | `08_update_gogh_sh_theme_list.py` | `data/themes.json` | `THEMES` array in `gogh.sh` |
| 9 | `09_write_run_timestamp.py` | — | `tools/run.txt` |
| 10 | `10_generate_wcag_report.js` | `data/themes.json` | `data/wcag.json`, `data/wcag-min.json` |

Run one script: `python tools/generate/01_generate_themes_json.py` (steps 1-9), `deno run --allow-all tools/generate/10_generate_wcag_report.js` (step 10).

Run all 10 locally: `./tools/generate-run_local.sh` (uses `uv run --with-requirements requirements.txt`, no venv to set up).

Run by CI: `.github/workflows/generate-on-push.yml` (push to `master`), `.github/workflows/generate-manual.yml` (`workflow_dispatch`).

## `validate/`

| File | Checks |
|---|---|
| `validate_colors.py` | every theme's hex color values are uppercase |
| `validate_pr.py` | PR title starts with `theme:`; every changed file is under `themes/` |

Run one script: `python tools/validate/validate_colors.py`, `python tools/validate/validate_pr.py <changed-files-list-path>`.

Run by CI: `.github/workflows/validate-on-pr.yml`.

## `lib/`

- `theme_common.py` — imported by `generate/` and `validate/`: `hash_palette`/`hash_background` (color hashing), `build_ordered_theme` (canonical field order), `slugify_theme_name`/`unique_path` (theme name → filename).

## `legacy/`

- `fortmat.py` — old-format YAML theme converter.
- `generate.sh` — old shell-based generator, pre-dates the Python/JS pipeline.

## `git-hooks/`

- `pre-commit` — blocks `git commit` if the commit touches `data/`, `installs/`, `gogh.sh`, or `tools/run.txt`.

Enable once per clone:

```bash
git config core.hooksPath tools/git-hooks
```

## Other files

- `run.txt` — output of `09_write_run_timestamp.py`, not a script.
