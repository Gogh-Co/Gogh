#!/usr/bin/env bash

export PROFILE_NAME="Desert"

export COLOR_01="#4D4D4D"           # Black (Host)
export COLOR_02="#FF2B2B"           # Red (Syntax string)
export COLOR_03="#98FB98"           # Green (Command)
export COLOR_04="#F0E68C"           # Yellow (Command second)
export COLOR_05="#CD853F"           # Blue (Path)
export COLOR_06="#FFDEAD"           # Magenta (Syntax var)
export COLOR_07="#FFA0A0"           # Cyan (Prompt)
export COLOR_08="#F5DEB3"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#55FF55"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#87CEFF"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#FFD700"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
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
