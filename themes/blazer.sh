#!/usr/bin/env bash

export PROFILE_NAME="Blazer"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B87A7A"           # Red (Syntax string)
export COLOR_03="#7AB87A"           # Green (Command)
export COLOR_04="#B8B87A"           # Yellow (Command second)
export COLOR_05="#7A7AB8"           # Blue (Path)
export COLOR_06="#B87AB8"           # Magenta (Syntax var)
export COLOR_07="#7AB8B8"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#DBBDBD"           # Bright Red (Command error)
export COLOR_11="#BDDBBD"           # Bright Green (Exec)
export COLOR_12="#DBDBBD"           # Bright Yellow
export COLOR_13="#BDBDDB"           # Bright Blue (Folder)
export COLOR_14="#DBBDDB"           # Bright Magenta
export COLOR_15="#BDDBDB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D1926"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
