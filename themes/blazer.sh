#!/usr/bin/env bash

export PROFILE_NAME="Blazer"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#b87a7a"           # Red (Syntax string)
export COLOR_03="#7ab87a"           # Green (Command)
export COLOR_04="#b8b87a"           # Yellow (Command second)
export COLOR_05="#7a7ab8"           # Blue (Path)
export COLOR_06="#b87ab8"           # Magenta (Syntax var)
export COLOR_07="#7ab8b8"           # Cyan (Prompt)
export COLOR_08="#d9d9d9"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#dbbdbd"           # Bright Red (Command error)
export COLOR_11="#bddbbd"           # Bright Green (Exec)
export COLOR_12="#dbdbbd"           # Bright Yellow
export COLOR_13="#bdbddb"           # Bright Blue (Folder)
export COLOR_14="#dbbddb"           # Bright Magenta
export COLOR_15="#bddbdb"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#0d1926"   # Background
export FOREGROUND_COLOR="#d9e6f2"   # Foreground (Text)

export CURSOR_COLOR="#d9e6f2" # Cursor

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
