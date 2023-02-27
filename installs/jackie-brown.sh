#!/usr/bin/env bash

export PROFILE_NAME="Jackie Brown"

export COLOR_01="#2C1D16"           # Black (Host)
export COLOR_02="#EF5734"           # Red (Syntax string)
export COLOR_03="#2BAF2B"           # Green (Command)
export COLOR_04="#BEBF00"           # Yellow (Command second)
export COLOR_05="#246EB2"           # Blue (Path)
export COLOR_06="#D05EC1"           # Magenta (Syntax var)
export COLOR_07="#00ACEE"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#E50000"           # Bright Red (Command error)
export COLOR_11="#86A93E"           # Bright Green (Exec)
export COLOR_12="#E5E500"           # Bright Yellow
export COLOR_13="#0000FF"           # Bright Blue (Folder)
export COLOR_14="#E500E5"           # Bright Magenta
export COLOR_15="#00E5E5"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#2C1D16"   # Background
export FOREGROUND_COLOR="#FFCC2F"   # Foreground (Text)

export CURSOR_COLOR="#FFCC2F" # Cursor

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
