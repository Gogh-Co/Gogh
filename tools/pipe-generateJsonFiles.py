import json
from pathlib import Path
import re
from unidecode import unidecode

# Load the JSON object from a file or a string
with open('./data/themes.json', 'r') as f:
    themes = json.load(f)

# Create or empty the directory to store the output files
output_dir = Path('./data/json')
output_dir.mkdir(parents=True, exist_ok=True)

# Remove existing JSON files in the directory
for file in output_dir.glob('*.json'):
    file.unlink()

# Iterate over each theme and write it to a new file
for theme in themes:
    # Get the name of the theme and remove accents
    name = theme.get('name', 'untitled').lower()
    name = unidecode(name)
    name = re.sub(r'[^\w-]+', '-', name)  # Replace non-alphanumeric characters with a dash
    name = name.strip('-')  # Remove leading and trailing dashes
    # Ensure filename is unique
    filename = output_dir / f'{name}.json'
    counter = 1
    while filename.exists():
        filename = output_dir / f'{name}-{counter}.json'
        counter += 1
    # Write the theme dictionary in the required order to JSON file
    ordered_theme = {
        "name": theme.get("name", ""),
        "author": theme.get("author", ""),
        "variant": theme.get("variant", ""),
        "color_01": theme.get("color_01", ""),
        "color_02": theme.get("color_02", ""),
        "color_03": theme.get("color_03", ""),
        "color_04": theme.get("color_04", ""),
        "color_05": theme.get("color_05", ""),
        "color_06": theme.get("color_06", ""),
        "color_07": theme.get("color_07", ""),
        "color_08": theme.get("color_08", ""),
        "color_09": theme.get("color_09", ""),
        "color_10": theme.get("color_10", ""),
        "color_11": theme.get("color_11", ""),
        "color_12": theme.get("color_12", ""),
        "color_13": theme.get("color_13", ""),
        "color_14": theme.get("color_14", ""),
        "color_15": theme.get("color_15", ""),
        "color_16": theme.get("color_16", ""),
        "background": theme.get("background", ""),
        "foreground": theme.get("foreground", ""),
        "cursor": theme.get("cursor", ""),
        "hash": theme.get("hash", "")
    }
    with open(filename, 'w') as f:
        json.dump(ordered_theme, f, indent=2)
