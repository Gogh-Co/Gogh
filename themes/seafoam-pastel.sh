#!/usr/bin/env bash

export PROFILE_NAME="Seafoam Pastel"

export COLOR_01="#757575"           # Black (Host)
export COLOR_02="#825d4d"           # Red (Syntax string)
export COLOR_03="#728c62"           # Green (Command)
export COLOR_04="#ada16d"           # Yellow (Command second)
export COLOR_05="#4d7b82"           # Blue (Path)
export COLOR_06="#8a7267"           # Magenta (Syntax var)
export COLOR_07="#729494"           # Cyan (Prompt)
export COLOR_08="#e0e0e0"           # White

export COLOR_09="#8a8a8a"           # Bright Black
export COLOR_10="#cf937a"           # Bright Red (Command error)
export COLOR_11="#98d9aa"           # Bright Green (Exec)
export COLOR_12="#fae79d"           # Bright Yellow
export COLOR_13="#7ac3cf"           # Bright Blue (Folder)
export COLOR_14="#d6b2a1"           # Bright Magenta
export COLOR_15="#ade0e0"           # Bright Cyan
export COLOR_16="#e0e0e0"           # Bright White

export BACKGROUND_COLOR="#243435"   # Background
export FOREGROUND_COLOR="#d4e7d4"   # Foreground (Text)

export CURSOR_COLOR="#d4e7d4" # Cursor

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
