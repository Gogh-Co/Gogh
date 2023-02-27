#!/usr/bin/env bash

export PROFILE_NAME="Sat"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DD0007"           # Red (Syntax string)
export COLOR_03="#07DD00"           # Green (Command)
export COLOR_04="#DDD600"           # Yellow (Command second)
export COLOR_05="#0007DD"           # Blue (Path)
export COLOR_06="#D600DD"           # Magenta (Syntax var)
export COLOR_07="#00DDD6"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#7D7D7D"           # Bright Black
export COLOR_10="#FF7478"           # Bright Red (Command error)
export COLOR_11="#78FF74"           # Bright Green (Exec)
export COLOR_12="#FFFA74"           # Bright Yellow
export COLOR_13="#7478FF"           # Bright Blue (Folder)
export COLOR_14="#FA74FF"           # Bright Magenta
export COLOR_15="#74FFFA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#758480"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

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
