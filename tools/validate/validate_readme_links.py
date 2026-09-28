# Validate that README.md's links to the apply functions point at the line
# where each function is defined, e.g.
#   [`apply_kitty()`](https://github.com/Gogh-Co/Gogh/blob/master/apply-colors.sh#L851)
#
# The anchors are plain line numbers, so they drift whenever lines are added
# or removed above a function. Run with --fix to rewrite them in place.
#
# Usage: python tools/validate/validate_readme_links.py [--fix]

import re
import sys
from pathlib import Path

README = Path("README.md")
LINK_RE = re.compile(
    r"\[`(?P<function>[\w-]+)\(\)`\]"
    r"\(https://github\.com/Gogh-Co/Gogh/blob/master/(?P<file>[\w./-]+)#L(?P<line>\d+)\)"
)

# Lines of each linked file, read once
_file_lines = {}


def definition_line(file, function):
    """1-based line where `function` is defined in `file`, or None."""
    if file not in _file_lines:
        path = Path(file)
        _file_lines[file] = path.read_text().splitlines() if path.is_file() else []
    pattern = re.compile(rf"^(function\s+)?{re.escape(function)}\s*\(\)")
    for number, line in enumerate(_file_lines[file], start=1):
        if pattern.match(line):
            return number
    return None


def check_links(text):
    """Return (fixed_text, problems) for every function link in `text`."""
    problems = []

    def fix(match):
        function, file, line = match["function"], match["file"], int(match["line"])
        actual = definition_line(file, function)
        if actual is None:
            problems.append(f"{function}() is not defined in {file} -- update or remove the link")
            return match[0]
        if actual != line:
            problems.append(f"{function}() links to {file}#L{line}, but it's defined at #L{actual}")
            return match[0].replace(f"#L{line})", f"#L{actual})")
        return match[0]

    return LINK_RE.sub(fix, text), problems


if __name__ == "__main__":
    fix_mode = sys.argv[1:] == ["--fix"]
    if sys.argv[1:] not in ([], ["--fix"]):
        print(f"Usage: python {sys.argv[0]} [--fix]")
        sys.exit(2)

    text = README.read_text()
    fixed, problems = check_links(text)
    undefined = [p for p in problems if "is not defined" in p]

    if fix_mode and fixed != text:
        README.write_text(fixed)
        print(f"🔧 Updated {len(problems) - len(undefined)} link(s) in {README}.")

    if undefined or (problems and not fix_mode):
        print(f"❌ {len(problems)} README link(s) out of date:\n")
        for problem in problems:
            print(f"  {problem}")
        if not fix_mode:
            print("\n  Run `task validate:readme-links-fix` (or this script with --fix) to update the line numbers.")
        sys.exit(1)

    print("✅ README links to the apply functions point at their definitions.")
