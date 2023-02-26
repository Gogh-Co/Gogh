#!/usr/bin/env bash

export PROFILE_NAME="Darkside"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#e8341c"           # Red (Syntax string)
export COLOR_03="#68c256"           # Green (Command)
export COLOR_04="#f2d42c"           # Yellow (Command second)
export COLOR_05="#1c98e8"           # Blue (Path)
export COLOR_06="#8e69c9"           # Magenta (Syntax var)
export COLOR_07="#1c98e8"           # Cyan (Prompt)
export COLOR_08="#bababa"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#e05a4f"           # Bright Red (Command error)
export COLOR_11="#77b869"           # Bright Green (Exec)
export COLOR_12="#efd64b"           # Bright Yellow
export COLOR_13="#387cd3"           # Bright Blue (Folder)
export COLOR_14="#957bbe"           # Bright Magenta
export COLOR_15="#3d97e2"           # Bright Cyan
export COLOR_16="#bababa"           # Bright White

export BACKGROUND_COLOR="#222324"   # Background
export FOREGROUND_COLOR="#bababa"   # Foreground (Text)

export CURSOR_COLOR="#bababa" # Cursor

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
