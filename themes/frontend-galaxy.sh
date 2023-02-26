#!/usr/bin/env bash

export PROFILE_NAME="Frontend Galaxy"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F9555F"           # Red (Syntax string)
export COLOR_03="#21B089"           # Green (Command)
export COLOR_04="#FEF02A"           # Yellow (Command second)
export COLOR_05="#589DF6"           # Blue (Path)
export COLOR_06="#944D95"           # Magenta (Syntax var)
export COLOR_07="#1F9EE7"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FA8C8F"           # Bright Red (Command error)
export COLOR_11="#35BB9A"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#589DF6"           # Bright Blue (Folder)
export COLOR_14="#E75699"           # Bright Magenta
export COLOR_15="#3979BC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D2837"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
