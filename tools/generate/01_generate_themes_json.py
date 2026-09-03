# Step 1 of the generate/ pipeline.
# Build data/themes.json from YAML theme files in themes/.
# Also writes a minified data/themes-min.json and includes a content hash.

import json
import sys
from pathlib import Path
import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import build_ordered_theme, hash_palette, hash_background

source_path = Path("./themes")
dest_path = Path("./data/themes.json")
themes = []

# Ensure the destination directory exists
dest_path.parent.mkdir(parents=True, exist_ok=True)

# Remove the destination file if it exists
if dest_path.exists():
    dest_path.unlink()

# Iterate over all .yml files in the source directory
for filepath in source_path.glob("*.yml"):
    with open(filepath, "r") as f:
        content = f.read()

    # Load the corrected YAML file
    data = yaml.safe_load(content)

    # hash: only the 16 ANSI colors (cosmetic fields excluded), so it changes
    # only if a palette color changes.
    # hash_bg: the background alone, so two themes with an identical palette
    # but a different background can still be told apart.
    data["hash"] = hash_palette(data)
    data["hash_bg"] = hash_background(data)

    themes.append(build_ordered_theme(data))

# Sort themes by name
themes.sort(key=lambda x: x["name"])

# Write the themes list to the JSON file with indentation
with open(dest_path, "w") as f:
    json.dump(themes, f, indent=2)

# Write the themes list to a minified JSON file without indentation
minified_dest_path = dest_path.with_name("themes-min.json")
with open(minified_dest_path, "w") as f:
    json.dump(themes, f, separators=(',', ':'))
