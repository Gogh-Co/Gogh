#!/usr/bin/env bash

export PROFILE_NAME="Ayu Dark"

export COLOR_01="#0A0E14"           # Black (Host)
export COLOR_02="#FF3333"           # Red (Syntax string)
export COLOR_03="#C2D94C"           # Green (Command)
export COLOR_04="#FF8F40"           # Yellow (Command second)
export COLOR_05="#59C2FF"           # Blue (Path)
export COLOR_06="#FFEE99"           # Magenta (Syntax var)
export COLOR_07="#95E6CB"           # Cyan (Prompt)
export COLOR_08="#B3B1AD"           # White

export COLOR_09="#4D5566"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#C2D94C"           # Bright Green (Exec)
export COLOR_12="#FF8F40"           # Bright Yellow
export COLOR_13="#59C2FF"           # Bright Blue (Folder)
export COLOR_14="#FFEE99"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#B3B1AD"           # Bright White

export BACKGROUND_COLOR="#0A0E14"   # Background
export FOREGROUND_COLOR="#B3B1AD"   # Foreground (Text)

export CURSOR_COLOR="#E6B450" # Cursor

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
