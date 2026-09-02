# Tools Pipeline

This folder contains scripts used to generate project data and installers.

## Execution order

Run the scripts in this order:

1. `pipe-generateJson.py`
   - Reads YAML themes from `themes/`.
   - Builds `data/themes.json` and `data/themes-min.json`.

2. `pipe-generateJsonFiles.py`
   - Splits `data/themes.json` into one file per theme in `data/json/`.

3. `pipe-generateTxtFiles.py`
   - Creates one TXT palette per theme in `data/txt/`.
   - Each file has 16 lines: `color_01` to `color_16`.

4. `pipe-generateCsv.py`
   - Exports `data/themes.json` to `data/themes.csv`.

5. `pipe-generateYaml.py`
   - Exports `data/themes.json` to `data/themes.yaml`.

6. `pipe-generateYamlFiles.py`
   - Splits `data/themes.json` into one file per theme in `data/yaml/`.

7. `pipe-generateShFiles.py`
   - Creates install scripts in `installs/` from `themes/*.yml`.

8. `pipe-updateThemes.py`
   - Updates the `THEMES` array in `gogh.sh`.

9. `pipe.py`
   - Writes the run timestamp to `tools/run.txt`.

10. `pipe-generateWcag.js`
    - Generates accessibility reports: `data/wcag.json` and `data/wcag-min.json`.

## Other files

- `fortmat.py`
  - Utility to convert old YAML themes from `themes_old/` to the new format.
  - Not part of the regular generator pipeline.

- `generate.sh`
  - Legacy shell generator script.
  - Not used by the current Python/JS pipeline.

- `run.txt`
  - Output file updated by `pipe.py` with the last run time.
