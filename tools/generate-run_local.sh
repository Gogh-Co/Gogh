#!/usr/bin/env bash
# Local, uv-managed runner for the tools/generate/ pipeline (steps 01-10).
#
# Lets you preview generated output (data/, installs/, gogh.sh, tools/run.txt)
# after editing themes/*.yml, without pushing and waiting on CI to regenerate
# it and then pulling. uv installs the Python dependencies from
# requirements.txt into an ephemeral environment on the fly, so there's no
# venv/pip setup to manage by hand.
#
# IMPORTANT: this output is CI-owned. Never commit data/, installs/, gogh.sh,
# or tools/run.txt by hand -- the pre-commit hook in tools/git-hooks/ refuses
# to let you. Run this only to inspect the result locally; let CI make the
# real commit on push.
#
# One-time setup to enable that hook in this clone:
#   git config core.hooksPath tools/git-hooks

set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

if ! command -v uv >/dev/null 2>&1; then
  echo "error: uv is required (https://docs.astral.sh/uv/) but was not found on PATH" >&2
  exit 1
fi

run_py() {
  echo "-> $1"
  uv run --with-requirements requirements.txt "$1"
}

run_py tools/generate/01_generate_themes_json.py
run_py tools/generate/02_split_themes_json.py
run_py tools/generate/03_split_themes_txt.py
run_py tools/generate/04_generate_themes_csv.py
run_py tools/generate/05_generate_themes_yaml.py
run_py tools/generate/06_split_themes_yaml.py
run_py tools/generate/07_generate_install_scripts.py
run_py tools/generate/08_update_gogh_sh_theme_list.py
run_py tools/generate/09_write_run_timestamp.py

if command -v deno >/dev/null 2>&1; then
  echo "-> tools/generate/10_generate_wcag_report.js"
  deno run --allow-all tools/generate/10_generate_wcag_report.js
else
  echo "skip: deno not found on PATH, skipping 10_generate_wcag_report.js (data/wcag*.json left untouched)" >&2
fi

cat <<'MSG'

Done. data/, installs/, gogh.sh and tools/run.txt were regenerated locally
so you can inspect them -- do not commit them, they're CI-owned. If the
pre-commit hook isn't set up yet in this clone, run:
  git config core.hooksPath tools/git-hooks
MSG
