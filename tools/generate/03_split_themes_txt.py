# Step 3 of the generate/ pipeline.
# Generate one TXT palette file per theme in data/txt.
# Each output file contains 16 lines with color_01..color_16 in order.

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import COLOR_FIELDS, slugify_theme_name, unique_path

# Load generated themes data
with open('./data/themes.json', 'r') as f:
    themes = json.load(f)

# Create or clean output directory
output_dir = Path('./data/txt')
output_dir.mkdir(parents=True, exist_ok=True)

for file in output_dir.glob('*.txt'):
    file.unlink()

# Generate one TXT file per theme
for theme in themes:
    slug = slugify_theme_name(theme.get('name', 'untitled'))
    filename = unique_path(output_dir, slug, '.txt')

    color_lines = [theme.get(field, '') for field in COLOR_FIELDS]

    with open(filename, 'w') as f:
        f.write('\n'.join(color_lines) + '\n')
