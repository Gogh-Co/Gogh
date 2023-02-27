#!/usr/bin/env bash

export PROFILE_NAME="Pixiefloss"

export COLOR_01="#2F2942"           # Black (Host)
export COLOR_02="#FF857F"           # Red (Syntax string)
export COLOR_03="#48B685"           # Green (Command)
export COLOR_04="#E6C000"           # Yellow (Command second)
export COLOR_05="#AE81FF"           # Blue (Path)
export COLOR_06="#EF6155"           # Magenta (Syntax var)
export COLOR_07="#C2FFDF"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#75507B"           # Bright Black
export COLOR_10="#F1568E"           # Bright Red (Command error)
export COLOR_11="#5ADBA2"           # Bright Green (Exec)
export COLOR_12="#D5A425"           # Bright Yellow
export COLOR_13="#C5A3FF"           # Bright Blue (Folder)
export COLOR_14="#EF6155"           # Bright Magenta
export COLOR_15="#C2FFFF"           # Bright Cyan
export COLOR_16="#F8F8F0"           # Bright White

export BACKGROUND_COLOR="#241F33"   # Background
export FOREGROUND_COLOR="#D1CAE8"   # Foreground (Text)

export CURSOR_COLOR="#D1CAE8" # Cursor

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
