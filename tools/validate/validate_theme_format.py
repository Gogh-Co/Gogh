# Validate the theme-authoring rules from README.md's "Create your Own
# Theme!" section that validate_colors.py doesn't cover:
#   - the filename matches the `name:` field exactly
#   - `name:` has no underscores
#   - foreground/background contrast meets a minimum legibility ratio
#
# Deliberately does NOT enforce Title Case or any other stylistic casing:
# Gogh accepts theme names as given by their original author/repo (e.g. from
# mbadolato/iTerm2-Color-Schemes), and plenty of legitimate ones aren't Title
# Case ("iTerm2", "0x96f", "branch", "cyberpunk-icy"...). Underscores are the
# one thing not worth accepting -- spaces or hyphens read better in a
# filename/URL, and no real source repo's names actually need one.
#
# Scoped to a changed-files list (like validate_pr.py), not the whole
# themes/ corpus, so a pre-existing issue never blocks an unrelated PR. Run
# with no argument for a full-repo audit instead.
#
# Usage: python tools/validate/validate_theme_format.py [changed-files-list-path]

import re
import sys
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import contrast_ratio

MIN_CONTRAST = 2.5  # WCAG AA for normal text is 4.5:1; this is a legibility
                     # floor, not a strict AA gate -- see tools/README.md.


def check_filename(filepath, name):
    if filepath.stem == name:
        return None
    return {
        "file": filepath.name,
        "rule": "filename matches name",
        "problem": f"filename '{filepath.stem}' != name: '{name}'",
        "fix": f"rename the file to '{name}.yml', or correct name: to '{filepath.stem}' -- whichever is the typo",
    }


def check_no_underscores(filepath, name):
    if "_" not in name:
        return None
    return {
        "file": filepath.name,
        "rule": "no underscores",
        "problem": f"name: '{name}' contains an underscore",
        "fix": f"use a space or hyphen instead: '{name.replace('_', ' ')}'",
    }


def check_contrast(filepath, data):
    fg, bg = data.get("foreground"), data.get("background")
    if not fg or not bg:
        return None
    ratio = contrast_ratio(fg, bg)
    if ratio >= MIN_CONTRAST:
        return None
    return {
        "file": filepath.name,
        "rule": "contrast",
        "problem": f"foreground {fg} vs background {bg} is only {ratio:.2f}:1",
        "fix": f"pick a lighter foreground or a darker background (need at least {MIN_CONTRAST}:1)",
    }


def find_violations(filepaths):
    violations = []
    for filepath in sorted(filepaths):
        data = yaml.safe_load(filepath.read_text())
        name = str(data.get("name", "")).strip()
        for check in (
            check_filename(filepath, name),
            check_no_underscores(filepath, name),
            check_contrast(filepath, data),
        ):
            if check:
                violations.append(check)
    return violations


def theme_filepaths_from_list(changed_files_path, themes_dir=Path("./themes")):
    lines = Path(changed_files_path).read_text().splitlines()
    paths = []
    for line in lines:
        line = line.strip()
        if not line or not line.startswith("themes/") or not line.endswith(".yml"):
            continue
        filepath = Path(line)
        if filepath.exists():  # skip files deleted by this PR
            paths.append(filepath)
    return paths


def print_report(violations):
    try:
        from rich.console import Console
        from rich.table import Table

        console = Console()
        table = Table(title="Theme format violations", show_lines=True)
        table.add_column("File", style="bold red")
        table.add_column("Rule", style="yellow")
        table.add_column("Problem")
        table.add_column("How to fix", style="green")
        for v in violations:
            table.add_row(v["file"], v["rule"], v["problem"], v["fix"])
        console.print(table)
    except ImportError:
        print(f"❌ {len(violations)} theme format violation(s):\n")
        for v in violations:
            print(f"- {v['file']} [{v['rule']}]")
            print(f"    problem: {v['problem']}")
            print(f"    fix:     {v['fix']}")


if __name__ == "__main__":
    if len(sys.argv) == 2:
        filepaths = theme_filepaths_from_list(sys.argv[1])
    elif len(sys.argv) == 1:
        filepaths = list(Path("./themes").glob("*.yml"))
    else:
        print(f"Usage: python {sys.argv[0]} [changed-files-list-path]")
        sys.exit(2)

    violations = find_violations(filepaths)
    if violations:
        print_report(violations)
        sys.exit(1)
    print("✅ All theme names and contrast ratios look good.")
