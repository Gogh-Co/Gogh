from unidecode import unidecode
import json
import os
import re
import subprocess
import yaml

folder_path = "./themes"
dest_path = "./installs"
themes = []

# Ensure the destination directory exists
os.makedirs(dest_path, exist_ok=True)

# Remove all files in the destination directory
for item in os.listdir(dest_path):
    item_path = os.path.join(dest_path, item)
    if os.path.isfile(item_path):
        os.remove(item_path)

# Process YAML files
for filename in os.listdir(folder_path):
    if filename.endswith(".yml"):
        file_path = os.path.join(folder_path, filename)

        # Read and clean YAML content
        with open(file_path, "r") as f:
            content = f.read()

        # Load the cleaned YAML
        data = yaml.safe_load(content)

        # Build the theme dictionary
        theme = {f"{key}": data[key] for key in data if key.startswith("color")}
        theme.update({
            "name": data["name"],
            "foreground": data["foreground"],
            "background": data["background"],
            "cursorColor": data["cursor"]
        })
        themes.append(theme)

# Sort themes by name
themes = sorted(themes, key=lambda x: x["name"])

# Shell script template
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

apply_theme() {{
    if [[ -e "${{GOGH_APPLY_SCRIPT}}" ]]; then
      bash "${{GOGH_APPLY_SCRIPT}}"
    elif [[ -e "${{PARENT_PATH}}/apply-colors.sh" ]]; then
      bash "${{PARENT_PATH}}/apply-colors.sh"
    elif [[ -e "${{SCRIPT_PATH}}/apply-colors.sh" ]]; then
      bash "${{SCRIPT_PATH}}/apply-colors.sh"
    else
      printf '\\n%s\\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${{SCRIPT_PATH:-$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)}}"
PARENT_PATH="$(dirname "${{SCRIPT_PATH}}")"

if [ -z "${{GOGH_NONINTERACTIVE+no}}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
"""

# Generate .sh files for each color scheme
for scheme in themes:
    # Convert theme name to a valid filename
    filename = re.sub(r'[^a-zA-Z0-9]+', '-', unidecode(scheme['name']).lower().replace(' ', '-'))
    filename = re.sub(r'[-]+', '-', filename).strip('-')
    filename = f"{dest_path}/{filename}.sh"

    with open(filename, 'w') as f:
        f.write(template.format(**scheme))

# Change permissions for generated scripts
for f in os.listdir(dest_path):
    file_path = os.path.join(dest_path, f)
    if os.path.isfile(file_path) and f.endswith('.sh'):
        subprocess.run(['chmod', '775', file_path])
