#!/usr/bin/env bash

export PROFILE_NAME="Campbell"

export COLOR_01="#0C0C0C"           # Black (Host)
export COLOR_02="#C50F1F"           # Red (Syntax string)
export COLOR_03="#13A10E"           # Green (Command)
export COLOR_04="#C19C00"           # Yellow (Command second)
export COLOR_05="#0037DA"           # Blue (Path)
export COLOR_06="#881798"           # Magenta (Syntax var)
export COLOR_07="#3A96DD"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#767676"           # Bright Black
export COLOR_10="#E74856"           # Bright Red (Command error)
export COLOR_11="#16C60C"           # Bright Green (Exec)
export COLOR_12="#F9F1A5"           # Bright Yellow
export COLOR_13="#3B78FF"           # Bright Blue (Folder)
export COLOR_14="#B4009E"           # Bright Magenta
export COLOR_15="#61D6D6"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#0C0C0C"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

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
