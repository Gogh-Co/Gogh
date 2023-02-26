#!/usr/bin/env bash

export PROFILE_NAME="Lavandula"

export COLOR_01="#230046"           # Black (Host)
export COLOR_02="#7D1625"           # Red (Syntax string)
export COLOR_03="#337E6F"           # Green (Command)
export COLOR_04="#7F6F49"           # Yellow (Command second)
export COLOR_05="#4F4A7F"           # Blue (Path)
export COLOR_06="#5A3F7F"           # Magenta (Syntax var)
export COLOR_07="#58777F"           # Cyan (Prompt)
export COLOR_08="#736E7D"           # White

export COLOR_09="#372D46"           # Bright Black
export COLOR_10="#E05167"           # Bright Red (Command error)
export COLOR_11="#52E0C4"           # Bright Green (Exec)
export COLOR_12="#E0C386"           # Bright Yellow
export COLOR_13="#8E87E0"           # Bright Blue (Folder)
export COLOR_14="#A776E0"           # Bright Magenta
export COLOR_15="#9AD4E0"           # Bright Cyan
export COLOR_16="#8C91FA"           # Bright White

export BACKGROUND_COLOR="#050014"   # Background
export FOREGROUND_COLOR="#736E7D"   # Foreground (Text)

export CURSOR_COLOR="#736E7D" # Cursor

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
