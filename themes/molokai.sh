#!/usr/bin/env bash

export PROFILE_NAME="Molokai"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#7325FA"           # Red (Syntax string)
export COLOR_03="#23E298"           # Green (Command)
export COLOR_04="#60D4DF"           # Yellow (Command second)
export COLOR_05="#D08010"           # Blue (Path)
export COLOR_06="#FF0087"           # Magenta (Syntax var)
export COLOR_07="#D0A843"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#9D66F6"           # Bright Red (Command error)
export COLOR_11="#5FE0B1"           # Bright Green (Exec)
export COLOR_12="#6DF2FF"           # Bright Yellow
export COLOR_13="#FFAF00"           # Bright Blue (Folder)
export COLOR_14="#FF87AF"           # Bright Magenta
export COLOR_15="#FFCE51"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
