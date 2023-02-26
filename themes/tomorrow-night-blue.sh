#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Blue"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF9DA3"           # Red (Syntax string)
export COLOR_03="#D1F1A9"           # Green (Command)
export COLOR_04="#FFEEAD"           # Yellow (Command second)
export COLOR_05="#BBDAFF"           # Blue (Path)
export COLOR_06="#EBBBFF"           # Magenta (Syntax var)
export COLOR_07="#99FFFF"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF9CA3"           # Bright Red (Command error)
export COLOR_11="#D0F0A8"           # Bright Green (Exec)
export COLOR_12="#FFEDAC"           # Bright Yellow
export COLOR_13="#BADAFF"           # Bright Blue (Folder)
export COLOR_14="#EBBAFF"           # Bright Magenta
export COLOR_15="#99FFFF"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#002451"   # Background
export FOREGROUND_COLOR="#FFFEFE"   # Foreground (Text)

export CURSOR_COLOR="#FFFEFE" # Cursor

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
