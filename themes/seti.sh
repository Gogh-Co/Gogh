#!/usr/bin/env bash

export PROFILE_NAME="Seti"

export COLOR_01="#323232"           # Black (Host)
export COLOR_02="#C22832"           # Red (Syntax string)
export COLOR_03="#8EC43D"           # Green (Command)
export COLOR_04="#E0C64F"           # Yellow (Command second)
export COLOR_05="#43A5D5"           # Blue (Path)
export COLOR_06="#8B57B5"           # Magenta (Syntax var)
export COLOR_07="#8EC43D"           # Cyan (Prompt)
export COLOR_08="#EEEEEE"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#C22832"           # Bright Red (Command error)
export COLOR_11="#8EC43D"           # Bright Green (Exec)
export COLOR_12="#E0C64F"           # Bright Yellow
export COLOR_13="#43A5D5"           # Bright Blue (Folder)
export COLOR_14="#8B57B5"           # Bright Magenta
export COLOR_15="#8EC43D"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#111213"   # Background
export FOREGROUND_COLOR="#CACECD"   # Foreground (Text)

export CURSOR_COLOR="#CACECD" # Cursor

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
