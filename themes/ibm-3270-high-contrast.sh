#!/usr/bin/env bash

export PROFILE_NAME="Ibm 3270 (High Contrast)"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#00FF00"           # Green (Command)
export COLOR_04="#FFFF00"           # Yellow (Command second)
export COLOR_05="#00BFFF"           # Blue (Path)
export COLOR_06="#FFC0CB"           # Magenta (Syntax var)
export COLOR_07="#40E0D0"           # Cyan (Prompt)
export COLOR_08="#BEBEBE"           # White

export COLOR_09="#414141"           # Bright Black
export COLOR_10="#FFA500"           # Bright Red (Command error)
export COLOR_11="#98FB98"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0000CD"           # Bright Blue (Folder)
export COLOR_14="#A020F0"           # Bright Magenta
export COLOR_15="#AEEEEE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FDFDFD"   # Foreground (Text)

export CURSOR_COLOR="#FDFDFD" # Cursor

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
