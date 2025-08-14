import json
import hashlib
from pathlib import Path
import yaml

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

    # Concatenate all values into a single string to generate a hash
    values = ''.join(str(value) for value in data.values())

    # Generate SHA-256 hash
    hash_hex = hashlib.sha256(values.encode()).hexdigest()

    # Build the theme dictionary in the required order
    theme = {
        "name": data.get("name", ""),
        "author": data.get("author", ""),
        "variant": data.get("variant", ""),
        "color_01": data.get("color_01", ""),
        "color_02": data.get("color_02", ""),
        "color_03": data.get("color_03", ""),
        "color_04": data.get("color_04", ""),
        "color_05": data.get("color_05", ""),
        "color_06": data.get("color_06", ""),
        "color_07": data.get("color_07", ""),
        "color_08": data.get("color_08", ""),
        "color_09": data.get("color_09", ""),
        "color_10": data.get("color_10", ""),
        "color_11": data.get("color_11", ""),
        "color_12": data.get("color_12", ""),
        "color_13": data.get("color_13", ""),
        "color_14": data.get("color_14", ""),
        "color_15": data.get("color_15", ""),
        "color_16": data.get("color_16", ""),
        "background": data.get("background", ""),
        "foreground": data.get("foreground", ""),
        "cursor": data.get("cursor", ""),
        "hash": hash_hex
    }
    themes.append(theme)

# Sort themes by name
themes.sort(key=lambda x: x["name"])

# Write the themes list to the JSON file with indentation
with open(dest_path, "w") as f:
    json.dump(themes, f, indent=2)

# Write the themes list to a minified JSON file without indentation
minified_dest_path = dest_path.with_name("themes-min.json")
with open(minified_dest_path, "w") as f:
    json.dump(themes, f, separators=(',', ':'))
