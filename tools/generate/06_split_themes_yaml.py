# Step 6 of the generate/ pipeline.
# Split data/themes.json into one YAML file per theme in data/yaml.
# Normalizes file names and avoids collisions with numeric suffixes.

import json
import sys
from pathlib import Path
import yaml

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import build_ordered_theme, slugify_theme_name, unique_path

# Load the JSON object from a file or a string
with open('./data/themes.json', 'r') as f:
    themes = json.load(f)

# Create or empty the directory to store the output files
output_dir = Path('./data/yaml')
output_dir.mkdir(parents=True, exist_ok=True)

# Remove existing YAML files in the directory
for file in output_dir.glob('*.yaml'):
    file.unlink()

# Iterate over each theme and write it to a new file
for theme in themes:
    slug = slugify_theme_name(theme.get('name', 'untitled'))
    filename = unique_path(output_dir, slug, '.yaml')
    with open(filename, 'w') as f:
        yaml.safe_dump(build_ordered_theme(theme), f, sort_keys=False, allow_unicode=True)
