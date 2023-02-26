#!/usr/bin/env bash

export PROFILE_NAME="Neopolitan"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#800000"           # Red (Syntax string)
export COLOR_03="#61CE3C"           # Green (Command)
export COLOR_04="#FBDE2D"           # Yellow (Command second)
export COLOR_05="#253B76"           # Blue (Path)
export COLOR_06="#FF0080"           # Magenta (Syntax var)
export COLOR_07="#8DA6CE"           # Cyan (Prompt)
export COLOR_08="#F8F8F8"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#800000"           # Bright Red (Command error)
export COLOR_11="#61CE3C"           # Bright Green (Exec)
export COLOR_12="#FBDE2D"           # Bright Yellow
export COLOR_13="#253B76"           # Bright Blue (Folder)
export COLOR_14="#FF0080"           # Bright Magenta
export COLOR_15="#8DA6CE"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#271F19"   # Background
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
