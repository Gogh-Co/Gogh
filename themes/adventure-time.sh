#!/usr/bin/env bash

export PROFILE_NAME="Adventure Time"

export COLOR_01="#050404"           # Black (Host)
export COLOR_02="#BD0013"           # Red (Syntax string)
export COLOR_03="#4AB118"           # Green (Command)
export COLOR_04="#E7741E"           # Yellow (Command second)
export COLOR_05="#0F4AC6"           # Blue (Path)
export COLOR_06="#665993"           # Magenta (Syntax var)
export COLOR_07="#70A598"           # Cyan (Prompt)
export COLOR_08="#F8DCC0"           # White

export COLOR_09="#4E7CBF"           # Bright Black
export COLOR_10="#FC5F5A"           # Bright Red (Command error)
export COLOR_11="#9EFF6E"           # Bright Green (Exec)
export COLOR_12="#EFC11A"           # Bright Yellow
export COLOR_13="#1997C6"           # Bright Blue (Folder)
export COLOR_14="#9B5953"           # Bright Magenta
export COLOR_15="#C8FAF4"           # Bright Cyan
export COLOR_16="#F6F5FB"           # Bright White

export BACKGROUND_COLOR="#1F1D45"   # Background
export FOREGROUND_COLOR="#F8DCC0"   # Foreground (Text)

export CURSOR_COLOR="#F8DCC0" # Cursor

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
