#!/usr/bin/env bash

export PROFILE_NAME="Neopolitan"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#800000"           # Red (Syntax string)
export COLOR_03="#61ce3c"           # Green (Command)
export COLOR_04="#fbde2d"           # Yellow (Command second)
export COLOR_05="#253b76"           # Blue (Path)
export COLOR_06="#ff0080"           # Magenta (Syntax var)
export COLOR_07="#8da6ce"           # Cyan (Prompt)
export COLOR_08="#f8f8f8"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#800000"           # Bright Red (Command error)
export COLOR_11="#61ce3c"           # Bright Green (Exec)
export COLOR_12="#fbde2d"           # Bright Yellow
export COLOR_13="#253b76"           # Bright Blue (Folder)
export COLOR_14="#ff0080"           # Bright Magenta
export COLOR_15="#8da6ce"           # Bright Cyan
export COLOR_16="#f8f8f8"           # Bright White

export BACKGROUND_COLOR="#271f19"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
