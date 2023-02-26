#!/usr/bin/env bash

export PROFILE_NAME="Kanagawa"

export COLOR_01="#090618"           # Black (Host)
export COLOR_02="#C34043"           # Red (Syntax string)
export COLOR_03="#76946A"           # Green (Command)
export COLOR_04="#C0A36E"           # Yellow (Command second)
export COLOR_05="#7E9CD8"           # Blue (Path)
export COLOR_06="#957FB8"           # Magenta (Syntax var)
export COLOR_07="#6A9589"           # Cyan (Prompt)
export COLOR_08="#DCD7BA"           # White

export COLOR_09="#727169"           # Bright Black
export COLOR_10="#E82424"           # Bright Red (Command error)
export COLOR_11="#98BB6C"           # Bright Green (Exec)
export COLOR_12="#E6C384"           # Bright Yellow
export COLOR_13="#7FB4CA"           # Bright Blue (Folder)
export COLOR_14="#938AA9"           # Bright Magenta
export COLOR_15="#7AA89F"           # Bright Cyan
export COLOR_16="#C8C093"           # Bright White

export BACKGROUND_COLOR="#1F1F28"   # Background
export FOREGROUND_COLOR="#DCD7BA"   # Foreground (Text)

export CURSOR_COLOR="#DCD7BA" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
