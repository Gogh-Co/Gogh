#!/usr/bin/env bash

export PROFILE_NAME="Spacegray"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B04B57"           # Red (Syntax string)
export COLOR_03="#87B379"           # Green (Command)
export COLOR_04="#E5C179"           # Yellow (Command second)
export COLOR_05="#7D8FA4"           # Blue (Path)
export COLOR_06="#A47996"           # Magenta (Syntax var)
export COLOR_07="#85A7A5"           # Cyan (Prompt)
export COLOR_08="#B3B8C3"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#B04B57"           # Bright Red (Command error)
export COLOR_11="#87B379"           # Bright Green (Exec)
export COLOR_12="#E5C179"           # Bright Yellow
export COLOR_13="#7D8FA4"           # Bright Blue (Folder)
export COLOR_14="#A47996"           # Bright Magenta
export COLOR_15="#85A7A5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#20242D"   # Background
export FOREGROUND_COLOR="#B3B8C3"   # Foreground (Text)

export CURSOR_COLOR="#B3B8C3" # Cursor

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
