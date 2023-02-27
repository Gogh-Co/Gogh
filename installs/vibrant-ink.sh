#!/usr/bin/env bash

export PROFILE_NAME="Vibrant Ink"

export COLOR_01="#878787"           # Black (Host)
export COLOR_02="#FF6600"           # Red (Syntax string)
export COLOR_03="#CCFF04"           # Green (Command)
export COLOR_04="#FFCC00"           # Yellow (Command second)
export COLOR_05="#44B4CC"           # Blue (Path)
export COLOR_06="#9933CC"           # Magenta (Syntax var)
export COLOR_07="#44B4CC"           # Cyan (Prompt)
export COLOR_08="#F5F5F5"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF0000"           # Bright Red (Command error)
export COLOR_11="#00FF00"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0000FF"           # Bright Blue (Folder)
export COLOR_14="#FF00FF"           # Bright Magenta
export COLOR_15="#00FFFF"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
