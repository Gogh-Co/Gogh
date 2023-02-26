#!/usr/bin/env bash

export PROFILE_NAME="Arthur"

export COLOR_01="#3D352A"           # Black (Host)
export COLOR_02="#CD5C5C"           # Red (Syntax string)
export COLOR_03="#86AF80"           # Green (Command)
export COLOR_04="#E8AE5B"           # Yellow (Command second)
export COLOR_05="#6495ED"           # Blue (Path)
export COLOR_06="#DEB887"           # Magenta (Syntax var)
export COLOR_07="#B0C4DE"           # Cyan (Prompt)
export COLOR_08="#BBAA99"           # White

export COLOR_09="#554444"           # Bright Black
export COLOR_10="#CC5533"           # Bright Red (Command error)
export COLOR_11="#88AA22"           # Bright Green (Exec)
export COLOR_12="#FFA75D"           # Bright Yellow
export COLOR_13="#87CEEB"           # Bright Blue (Folder)
export COLOR_14="#996600"           # Bright Magenta
export COLOR_15="#B0C4DE"           # Bright Cyan
export COLOR_16="#DDCCBB"           # Bright White

export BACKGROUND_COLOR="#1C1C1C"   # Background
export FOREGROUND_COLOR="#DDEEDD"   # Foreground (Text)

export CURSOR_COLOR="#DDEEDD" # Cursor

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
