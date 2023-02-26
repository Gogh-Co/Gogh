#!/usr/bin/env bash

export PROFILE_NAME="Geohot"

export COLOR_01="#F9F5F5"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#1F1E1F"           # Green (Command)
export COLOR_04="#ADA110"           # Yellow (Command second)
export COLOR_05="#FF004E"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#06919A"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#EF2929"           # Bright Red (Command error)
export COLOR_11="#FF0000"           # Bright Green (Exec)
export COLOR_12="#ADA110"           # Bright Yellow
export COLOR_13="#5F4AA6"           # Bright Blue (Folder)
export COLOR_14="#B74438"           # Bright Magenta
export COLOR_15="#408F0C"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1F1E1F"   # Background
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
