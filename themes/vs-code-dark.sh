#!/usr/bin/env bash

export PROFILE_NAME="Vs Code Dark+"

export COLOR_01="#6A787A"           # Black (Host)
export COLOR_02="#E9653B"           # Red (Syntax string)
export COLOR_03="#39E9A8"           # Green (Command)
export COLOR_04="#E5B684"           # Yellow (Command second)
export COLOR_05="#44AAE6"           # Blue (Path)
export COLOR_06="#E17599"           # Magenta (Syntax var)
export COLOR_07="#3DD5E7"           # Cyan (Prompt)
export COLOR_08="#C3DDE1"           # White

export COLOR_09="#598489"           # Bright Black
export COLOR_10="#E65029"           # Bright Red (Command error)
export COLOR_11="#00FF9A"           # Bright Green (Exec)
export COLOR_12="#E89440"           # Bright Yellow
export COLOR_13="#009AFB"           # Bright Blue (Folder)
export COLOR_14="#FF578F"           # Bright Magenta
export COLOR_15="#5FFFFF"           # Bright Cyan
export COLOR_16="#D9FBFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
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
