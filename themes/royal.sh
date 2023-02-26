#!/usr/bin/env bash

export PROFILE_NAME="Royal"

export COLOR_01="#241F2B"           # Black (Host)
export COLOR_02="#91284C"           # Red (Syntax string)
export COLOR_03="#23801C"           # Green (Command)
export COLOR_04="#B49D27"           # Yellow (Command second)
export COLOR_05="#6580B0"           # Blue (Path)
export COLOR_06="#674D96"           # Magenta (Syntax var)
export COLOR_07="#8AAABE"           # Cyan (Prompt)
export COLOR_08="#524966"           # White

export COLOR_09="#312D3D"           # Bright Black
export COLOR_10="#D5356C"           # Bright Red (Command error)
export COLOR_11="#2CD946"           # Bright Green (Exec)
export COLOR_12="#FDE83B"           # Bright Yellow
export COLOR_13="#90BAF9"           # Bright Blue (Folder)
export COLOR_14="#A479E3"           # Bright Magenta
export COLOR_15="#ACD4EB"           # Bright Cyan
export COLOR_16="#9E8CBD"           # Bright White

export BACKGROUND_COLOR="#100815"   # Background
export FOREGROUND_COLOR="#514968"   # Foreground (Text)

export CURSOR_COLOR="#514968" # Cursor

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
