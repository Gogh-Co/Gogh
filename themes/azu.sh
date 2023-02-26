#!/usr/bin/env bash

export PROFILE_NAME="Azu"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ac6d74"           # Red (Syntax string)
export COLOR_03="#74ac6d"           # Green (Command)
export COLOR_04="#aca46d"           # Yellow (Command second)
export COLOR_05="#6d74ac"           # Blue (Path)
export COLOR_06="#a46dac"           # Magenta (Syntax var)
export COLOR_07="#6daca4"           # Cyan (Prompt)
export COLOR_08="#e6e6e6"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#d6b8bc"           # Bright Red (Command error)
export COLOR_11="#bcd6b8"           # Bright Green (Exec)
export COLOR_12="#d6d3b8"           # Bright Yellow
export COLOR_13="#b8bcd6"           # Bright Blue (Folder)
export COLOR_14="#d3b8d6"           # Bright Magenta
export COLOR_15="#b8d6d3"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#09111a"   # Background
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
