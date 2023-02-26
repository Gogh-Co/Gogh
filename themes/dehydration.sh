#!/usr/bin/env bash

export PROFILE_NAME="Dehydration"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#5FD38D"           # Green (Command)
export COLOR_04="#FF9955"           # Yellow (Command second)
export COLOR_05="#3771C8"           # Blue (Path)
export COLOR_06="#BC5FD3"           # Magenta (Syntax var)
export COLOR_07="#5FD3BC"           # Cyan (Prompt)
export COLOR_08="#999999"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF8080"           # Bright Red (Command error)
export COLOR_11="#87DEAA"           # Bright Green (Exec)
export COLOR_12="#FFB380"           # Bright Yellow
export COLOR_13="#5F8DD3"           # Bright Blue (Folder)
export COLOR_14="#CD87DE"           # Bright Magenta
export COLOR_15="#87DECD"           # Bright Cyan
export COLOR_16="#CCCCCC"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
