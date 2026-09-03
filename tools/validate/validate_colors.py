# Validate that every theme's hex color values (16 ANSI colors plus
# background/foreground/cursor) are uppercase. Run in CI on pull requests
# that touch themes/**.

import re
import sys
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import COLOR_FIELDS

CHECK_FIELDS = COLOR_FIELDS + ["background", "foreground", "cursor"]
HEX_RE = re.compile(r"^#[0-9A-Fa-f]{6}$")


def find_violations(source_path=Path("./themes")):
    violations = []
    for filepath in sorted(source_path.glob("*.yml")):
        data = yaml.safe_load(filepath.read_text())
        for field in CHECK_FIELDS:
            value = data.get(field)
            if not value:
                continue
            value = str(value).strip()
            if HEX_RE.match(value) and value != value.upper():
                violations.append((filepath.name, field, value))
    return violations


if __name__ == "__main__":
    violations = find_violations()
    if violations:
        print(f"❌ {len(violations)} color value(s) not in uppercase:\n")
        for filename, field, value in violations:
            print(f"  {filename}: {field} = '{value}' (expected '{value.upper()}')")
        sys.exit(1)
    print("✅ All theme colors are uppercase.")
