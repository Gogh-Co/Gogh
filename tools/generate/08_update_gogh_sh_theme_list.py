# Step 8 of the generate/ pipeline.
# Refresh the THEMES array in gogh.sh using names from data/themes.json.
# Produces sorted and de-duplicated .sh entries.
#
# NOTE: this uses its own slugify regex (line below) rather than
# lib.theme_common.slugify_theme_name(), and de-dupes via set() with no
# collision suffix — two theme names that slug to the same string silently
# collapse to one gogh.sh entry. Left as-is here (same behavior as before
# this reorg); fixing it is a separate, deliberate change since it changes
# what ships in gogh.sh's public THEMES list.

import json
import re
from unidecode import unidecode

input_file = 'data/themes.json'
output_file = 'gogh.sh'

start_text = "declare -a THEMES=("
end_text = ")"

with open(input_file, "r") as f:
    data = json.load(f)

theme_names = [re.sub(r'[^a-zA-Z0-9\s]+', '-', unidecode(theme["name"]).lower().replace(' ', '-')).rstrip('-') for theme in data]
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
