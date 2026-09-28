# Step 8 of the generate/ pipeline.
# Refresh the THEMES array in gogh.sh using names from data/themes.json.
# Produces sorted and de-duplicated .sh entries.
#
# NOTE: this uses lib.theme_common.gogh_list_slug() rather than
# slugify_theme_name(), and de-dupes via set() with no collision suffix --
# two theme names that slug to the same string would collapse to one gogh.sh
# entry. validate_theme_format.py prevents that by rejecting a new theme
# whose slug is already taken, so existing themes keep their entry.

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from lib.theme_common import gogh_list_slug

input_file = 'data/themes.json'
output_file = 'gogh.sh'

start_text = "declare -a THEMES=("
end_text = ")"

with open(input_file, "r") as f:
    data = json.load(f)

theme_names = [gogh_list_slug(theme["name"]) for theme in data]
themes = sorted(list(set([f"{name}.sh" for name in theme_names])))

with open(output_file, "r") as f:
    lines = f.readlines()

with open(output_file, "w") as f:
    found_start = False
    for line in lines:
        if start_text in line:
            found_start = True
            f.write(line)
            for theme in themes:
                f.write(f"  '{theme}'\n")
        elif end_text in line:
            found_start = False
            f.write(line)
        elif not found_start:
            f.write(line)
