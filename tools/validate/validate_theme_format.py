# Validate the theme-authoring rules from README.md's "Create your Own
# Theme!" section that validate_colors.py doesn't cover:
#   - the filename matches the `name:` field exactly              (blocking)
#   - `name:` has no underscores                                  (blocking)
#   - `variant:` is exactly 'dark' or 'light' (lowercase), or empty (blocking)
#   - the name doesn't collide with another theme's file names    (blocking)
#   - foreground/background contrast meets a legibility floor  (recommended)
#
# Name collisions: a theme name becomes several file names (gogh.sh's
# THEMES entry, installs/<slug>.sh and the data/ files), and two names can
# map to the same one ("Foo Bar" and "Foo-Bar" are both foo-bar). A new
# theme that collides with an existing one fails: the existing theme keeps
# its name, and the new one has to pick another. Two new themes in the same
# PR that collide with each other both fail.
#
# Contrast is recommended, not blocking: it's a judgment call ("is this
# still legible"), not a hard fact like a filename mismatch, so a low ratio
# is reported but never fails the PR -- see tools/README.md.
#
# Deliberately does NOT enforce Title Case or any other stylistic casing:
# Gogh accepts theme names as given by their original author/repo (e.g. from
# mbadolato/iTerm2-Color-Schemes), and plenty of legitimate ones aren't Title
# Case ("iTerm2", "0x96f", "branch", "cyberpunk-icy"...). Underscores are the
# one thing not worth accepting -- spaces or hyphens read better in a
# filename/URL, and no real source repo's names actually need one.
#
# Scoped to newly ADDED theme files only (git diff --diff-filter=A against a
# base ref), not the whole themes/ corpus and not files merely modified: a
# pre-existing issue in a theme nobody is touching right now should never
# block an unrelated PR, and editing an existing theme for an unrelated
# reason shouldn't suddenly force fixing its unrelated old name/contrast
# either. Run with no argument for a full-repo audit instead.
#
# Usage: python tools/validate/validate_theme_format.py [base-ref]

import subprocess
import sys
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import contrast_ratio, theme_file_slugs

MIN_CONTRAST = 2.5  # WCAG AA for normal text is 4.5:1; this is a legibility
                     # floor, not a strict AA gate -- see tools/README.md.

VALID_VARIANTS = {"dark", "light"}


def check_filename(filepath, name):
    if filepath.stem == name:
        return None
    return {
        "file": filepath.name,
        "level": "error",
        "rule": "filename matches name",
        "problem": f"filename '{filepath.stem}' != name: '{name}'",
        "fix": f"rename the file to '{name}.yml', or correct name: to '{filepath.stem}' -- whichever is the typo",
    }


def check_no_underscores(filepath, name):
    if "_" not in name:
        return None
    return {
        "file": filepath.name,
        "level": "error",
        "rule": "no underscores",
        "problem": f"name: '{name}' contains an underscore",
        "fix": f"use a space or hyphen instead: '{name.replace('_', ' ')}'",
    }


def check_variant(filepath, data):
    variant = data.get("variant")
    if variant is None:
        return None
    variant = str(variant).strip()
    if variant == "" or variant in VALID_VARIANTS:
        return None
    fix = (
        f"lowercase it: variant: '{variant.lower()}'"
        if variant.lower() in VALID_VARIANTS
        else "set it to 'dark' or 'light' (or leave it empty)"
    )
    return {
        "file": filepath.name,
        "level": "error",
        "rule": "variant is dark/light",
        "problem": f"variant: '{variant}' is not exactly 'dark' or 'light'",
        "fix": fix,
    }


def theme_name(data):
    return str(data.get("name", "")).strip()


def check_name_collisions(filepaths, all_filepaths):
    """Errors for each theme in `filepaths` whose file names collide with
    any other theme in `all_filepaths` (the whole themes/ directory)."""
    names = {
        filepath.name: theme_name(yaml.safe_load(filepath.read_text()))
        for filepath in all_filepaths
    }
    checked = {filepath.name for filepath in filepaths}
    owners = {}
    for file, name in names.items():
        for where, slug in theme_file_slugs(name).items():
            owners.setdefault((where, slug), []).append(file)

    violations = []
    for file in sorted(checked):
        clashes = {}
        for where, slug in theme_file_slugs(names[file]).items():
            for other in owners[(where, slug)]:
                if other != file:
                    clashes.setdefault(other, []).append(f"{where} '{slug}'")
        for other, places in sorted(clashes.items()):
            existing = other not in checked
            violations.append({
                "file": file,
                "level": "error",
                "rule": "unique name",
                "problem": (
                    f"name: '{names[file]}' collides with "
                    f"{'existing theme' if existing else 'theme'} "
                    f"'{names[other]}' ({other}) on {', '.join(places)}"
                ),
                "fix": (
                    "pick a different name -- the existing theme keeps its name"
                    if existing else
                    "rename one of the two themes"
                ),
            })
    return violations


def check_contrast(filepath, data):
    fg, bg = data.get("foreground"), data.get("background")
    if not fg or not bg:
        return None
    ratio = contrast_ratio(fg, bg)
    if ratio >= MIN_CONTRAST:
        return None
    return {
        "file": filepath.name,
        "level": "recommended",
        "rule": "contrast",
        "problem": f"foreground {fg} vs background {bg} is only {ratio:.2f}:1",
        "fix": f"pick a lighter foreground or a darker background (recommended: at least {MIN_CONTRAST}:1)",
    }


def find_violations(filepaths):
    violations = []
    for filepath in sorted(filepaths):
        data = yaml.safe_load(filepath.read_text())
        name = theme_name(data)
        for check in (
            check_filename(filepath, name),
            check_no_underscores(filepath, name),
            check_variant(filepath, data),
            check_contrast(filepath, data),
        ):
            if check:
                violations.append(check)
    violations.extend(
        check_name_collisions(filepaths, list(Path("./themes").glob("*.yml")))
    )
    return violations


def added_theme_filepaths(base_ref):
    """themes/*.yml files added (not modified, not renamed) between
    base_ref and HEAD."""
    result = subprocess.run(
        ["git", "diff", "--name-only", "--diff-filter=A",
         f"{base_ref}...HEAD", "--", "themes/*.yml"],
        capture_output=True, text=True, check=True,
    )
    return [Path(line) for line in result.stdout.splitlines() if line.strip()]


def print_report(title, violations, row_style):
    try:
        from rich.console import Console
        from rich.table import Table

        console = Console()
        table = Table(title=title, show_lines=True)
        table.add_column("File", style=f"bold {row_style}")
        table.add_column("Rule", style="yellow")
        table.add_column("Problem")
        table.add_column("How to fix", style="green")
        for v in violations:
            table.add_row(v["file"], v["rule"], v["problem"], v["fix"])
        console.print(table)
    except ImportError:
        print(f"{title}:\n")
        for v in violations:
            print(f"- {v['file']} [{v['rule']}]")
            print(f"    problem: {v['problem']}")
            print(f"    fix:     {v['fix']}")


if __name__ == "__main__":
    if len(sys.argv) == 2:
        filepaths = added_theme_filepaths(sys.argv[1])
    elif len(sys.argv) == 1:
        filepaths = list(Path("./themes").glob("*.yml"))
    else:
        print(f"Usage: python {sys.argv[0]} [base-ref]")
        sys.exit(2)

    violations = find_violations(filepaths)
    errors = [v for v in violations if v["level"] == "error"]
    warnings = [v for v in violations if v["level"] == "recommended"]

    if warnings:
        print_report(f"⚠️  {len(warnings)} recommendation(s) -- won't block this PR", warnings, "yellow")

    if errors:
        print_report(f"❌ {len(errors)} theme format violation(s)", errors, "red")
        sys.exit(1)

    print("✅ Filename, underscore, variant, and unique name checks passed." + (" (see recommendations above)" if warnings else ""))
