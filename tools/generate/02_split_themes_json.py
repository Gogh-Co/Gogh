# Step 2 of the generate/ pipeline.
# Split data/themes.json into one JSON file per theme in data/json.
# Normalizes file names and avoids collisions with numeric suffixes.

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import build_ordered_theme, slugify_theme_name, unique_path

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
    slug = slugify_theme_name(theme.get('name', 'untitled'))
    filename = unique_path(output_dir, slug, '.json')
    with open(filename, 'w') as f:
        json.dump(build_ordered_theme(theme), f, indent=2)
