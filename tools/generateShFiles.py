from unidecode import unidecode
import json
import os
import re
import subprocess
import yaml

folder_path = "./themes"
dest_path = './installs'
themes = []

# List files and directories in the folder
folder_contents = os.listdir(dest_path)

# Delete each file in the folder
for item in folder_contents:
    item_path = os.path.join(dest_path, item)
    if os.path.isfile(item_path):
        os.remove(item_path)

for filename in os.listdir(folder_path):
    if filename.endswith(".yml"):
        with open(os.path.join(folder_path, filename), "r") as f:
            data = yaml.safe_load(f)
            theme = {f"{key}": data[key] for key in data if key.startswith("color")}
            theme.update({
                "name": data["name"],
                "foreground": data["foreground"],
                "background": data["background"],
                "cursorColor": data["cursor"]
            })
            themes.append(theme)

themes = sorted(themes, key=lambda x: x["name"])

colors_data = {"themes": themes}


# create a template string for the shell script
template = """\
#!/usr/bin/env bash

export PROFILE_NAME="{name}"

export COLOR_01="{color_01}"           # Black (Host)
export COLOR_02="{color_02}"           # Red (Syntax string)
export COLOR_03="{color_03}"           # Green (Command)
export COLOR_04="{color_04}"           # Yellow (Command second)
export COLOR_05="{color_05}"           # Blue (Path)
export COLOR_06="{color_06}"           # Magenta (Syntax var)
export COLOR_07="{color_07}"           # Cyan (Prompt)
export COLOR_08="{color_08}"           # White

export COLOR_09="{color_09}"           # Bright Black
export COLOR_10="{color_10}"           # Bright Red (Command error)
export COLOR_11="{color_11}"           # Bright Green (Exec)
export COLOR_12="{color_12}"           # Bright Yellow
export COLOR_13="{color_13}"           # Bright Blue (Folder)
export COLOR_14="{color_14}"           # Bright Magenta
export COLOR_15="{color_15}"           # Bright Cyan
export COLOR_16="{color_16}"           # Bright White

export BACKGROUND_COLOR="{background}"   # Background
export FOREGROUND_COLOR="{foreground}"   # Foreground (Text)

export CURSOR_COLOR="{cursorColor}" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${{SCRIPT_PATH:-$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)}}"
PARENT_PATH="$(dirname "${{SCRIPT_PATH}}")"

if [[ -e "${{GOGH_APPLY_SCRIPT}}" ]]; then
  bash "${{GOGH_APPLY_SCRIPT}}"
elif [[ -e "${{PARENT_PATH}}/apply-colors.sh" ]]; then
  bash "${{PARENT_PATH}}/apply-colors.sh"
elif [[ -e "${{SCRIPT_PATH}}/apply-colors.sh" ]]; then
  bash "${{SCRIPT_PATH}}/apply-colors.sh"
else
  printf '\\n%s\\n' "Error: Couldn't find apply-colors.sh"
  exit 1
fi
"""

# loop over the color schemes and create a new shell script for each one
for scheme in colors_data['themes']:
    # convert the scheme name to lowercase, replace spaces with dashes, remove accents, and replace non-alphanumeric characters with underscores
    filename = re.sub(r'[^a-zA-Z0-9]+', '-', unidecode(scheme['name']).lower().replace(' ', '-'))
    filename = re.sub(r'[-]+', '-', filename).strip('-')
    filename = f"{dest_path}/{filename}.sh"
    with open(filename, 'w') as f:
        f.write(template.format(**scheme))

# Find all files with ".sh" extension in the folder
files = [f for f in os.listdir(dest_path) if os.path.isfile(os.path.join(dest_path, f)) and f.endswith('.sh')]

# Change permissions on each file
for f in files:
    subprocess.run(['chmod', '775', os.path.join(dest_path, f)])
