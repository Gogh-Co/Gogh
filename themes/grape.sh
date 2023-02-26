#!/usr/bin/env bash

export PROFILE_NAME="Grape"

export COLOR_01="#2D283F"           # Black (Host)
export COLOR_02="#ED2261"           # Red (Syntax string)
export COLOR_03="#1FA91B"           # Green (Command)
export COLOR_04="#8DDC20"           # Yellow (Command second)
export COLOR_05="#487DF4"           # Blue (Path)
export COLOR_06="#8D35C9"           # Magenta (Syntax var)
export COLOR_07="#3BDEED"           # Cyan (Prompt)
export COLOR_08="#9E9EA0"           # White

export COLOR_09="#59516A"           # Bright Black
export COLOR_10="#F0729A"           # Bright Red (Command error)
export COLOR_11="#53AA5E"           # Bright Green (Exec)
export COLOR_12="#B2DC87"           # Bright Yellow
export COLOR_13="#A9BCEC"           # Bright Blue (Folder)
export COLOR_14="#AD81C2"           # Bright Magenta
export COLOR_15="#9DE3EB"           # Bright Cyan
export COLOR_16="#A288F7"           # Bright White

export BACKGROUND_COLOR="#171423"   # Background
export FOREGROUND_COLOR="#9F9FA1"   # Foreground (Text)

export CURSOR_COLOR="#9F9FA1" # Cursor

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
