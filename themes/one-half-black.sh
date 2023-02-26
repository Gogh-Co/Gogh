#!/usr/bin/env bash

export PROFILE_NAME="One Half Black"

export COLOR_01="#282c34"           # Black (Host)
export COLOR_02="#e06c75"           # Red (Syntax string)
export COLOR_03="#98c379"           # Green (Command)
export COLOR_04="#e5c07b"           # Yellow (Command second)
export COLOR_05="#61afef"           # Blue (Path)
export COLOR_06="#c678dd"           # Magenta (Syntax var)
export COLOR_07="#56b6c2"           # Cyan (Prompt)
export COLOR_08="#dcdfe4"           # White

export COLOR_09="#282c34"           # Bright Black
export COLOR_10="#e06c75"           # Bright Red (Command error)
export COLOR_11="#98c379"           # Bright Green (Exec)
export COLOR_12="#e5c07b"           # Bright Yellow
export COLOR_13="#61afef"           # Bright Blue (Folder)
export COLOR_14="#c678dd"           # Bright Magenta
export COLOR_15="#56b6c2"           # Bright Cyan
export COLOR_16="#dcdfe4"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#dcdfe4"   # Foreground (Text)

export CURSOR_COLOR="#dcdfe4" # Cursor

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
