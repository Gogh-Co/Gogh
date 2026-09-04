# Tools

| Folder | Files | Run with |
|---|---|---|
| [`generate/`](#generate) | `01_generate_themes_json.py` … `10_generate_wcag_report.js` | `./tools/generate-run_local.sh`, or CI (`generate-on-push.yml`, `generate-manual.yml`) |
| [`validate/`](#validate) | `validate_colors.py`, `validate_theme_format.py`, `validate_pr.py` | CI (`validate-on-pr.yml`), or `task validate` locally |
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

| File | Checks | Scope |
|---|---|---|
| `validate_colors.py` | every theme's hex color values are uppercase | all of `themes/*.yml` |
| `validate_theme_format.py` | filename matches `name:`; `name:` has no underscores; foreground/background contrast ≥ 2.5:1 | only the files passed in (a changed-files list), or all of `themes/*.yml` with no argument |
| `validate_pr.py` | PR title starts with `theme:`; every changed file is under `themes/` | the files passed in (a changed-files list) |

Run one script: `python tools/validate/validate_colors.py`, `python tools/validate/validate_theme_format.py [changed-files-list-path]`, `python tools/validate/validate_pr.py <changed-files-list-path>`.

`validate_theme_format.py` deliberately doesn't enforce Title Case or any other casing style: Gogh accepts theme names as given by their original author/repo (e.g. mbadolato/iTerm2-Color-Schemes), and plenty of legitimate ones aren't Title Case (`iTerm2 Default`, `0x96f`, `branch`...). Underscores are the one thing it does reject, since a space or hyphen reads better and no real source repo's names need one. It also takes an optional changed-files list so a pre-existing issue never blocks an unrelated PR: CI and `task validate` both pass it only the files touched by the current PR/branch; run it with no argument for a full-repo audit.

Run by CI: `.github/workflows/validate-on-pr.yml`. Run all three locally: `task validate` (see [`CONTRIBUTING.md`](../CONTRIBUTING.md)).

## `lib/`

- `theme_common.py` — imported by `generate/` and `validate/`: `hash_palette`/`hash_background` (color hashing), `build_ordered_theme` (canonical field order), `slugify_theme_name`/`unique_path` (theme name → filename), `contrast_ratio` (WCAG contrast between two hex colors).

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
