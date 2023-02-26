#!/usr/bin/env bash

export PROFILE_NAME="Desert"

export COLOR_01="#4d4d4d"           # Black (Host)
export COLOR_02="#ff2b2b"           # Red (Syntax string)
export COLOR_03="#98fb98"           # Green (Command)
export COLOR_04="#f0e68c"           # Yellow (Command second)
export COLOR_05="#cd853f"           # Blue (Path)
export COLOR_06="#ffdead"           # Magenta (Syntax var)
export COLOR_07="#ffa0a0"           # Cyan (Prompt)
export COLOR_08="#f5deb3"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#ff5555"           # Bright Red (Command error)
export COLOR_11="#55ff55"           # Bright Green (Exec)
export COLOR_12="#ffff55"           # Bright Yellow
export COLOR_13="#87ceff"           # Bright Blue (Folder)
export COLOR_14="#ff55ff"           # Bright Magenta
export COLOR_15="#ffd700"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
