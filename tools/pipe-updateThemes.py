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
