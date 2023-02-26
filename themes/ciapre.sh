#!/usr/bin/env bash

export PROFILE_NAME="Ciapre"

export COLOR_01="#181818"           # Black (Host)
export COLOR_02="#810009"           # Red (Syntax string)
export COLOR_03="#48513B"           # Green (Command)
export COLOR_04="#CC8B3F"           # Yellow (Command second)
export COLOR_05="#576D8C"           # Blue (Path)
export COLOR_06="#724D7C"           # Magenta (Syntax var)
export COLOR_07="#5C4F4B"           # Cyan (Prompt)
export COLOR_08="#AEA47F"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#AC3835"           # Bright Red (Command error)
export COLOR_11="#A6A75D"           # Bright Green (Exec)
export COLOR_12="#DCDF7C"           # Bright Yellow
export COLOR_13="#3097C6"           # Bright Blue (Folder)
export COLOR_14="#D33061"           # Bright Magenta
export COLOR_15="#F3DBB2"           # Bright Cyan
export COLOR_16="#F4F4F4"           # Bright White

export BACKGROUND_COLOR="#191C27"   # Background
export FOREGROUND_COLOR="#AEA47A"   # Foreground (Text)

export CURSOR_COLOR="#AEA47A" # Cursor

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
