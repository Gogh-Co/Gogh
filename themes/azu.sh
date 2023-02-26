#!/usr/bin/env bash

export PROFILE_NAME="Azu"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#AC6D74"           # Red (Syntax string)
export COLOR_03="#74AC6D"           # Green (Command)
export COLOR_04="#ACA46D"           # Yellow (Command second)
export COLOR_05="#6D74AC"           # Blue (Path)
export COLOR_06="#A46DAC"           # Magenta (Syntax var)
export COLOR_07="#6DACA4"           # Cyan (Prompt)
export COLOR_08="#E6E6E6"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#D6B8BC"           # Bright Red (Command error)
export COLOR_11="#BCD6B8"           # Bright Green (Exec)
export COLOR_12="#D6D3B8"           # Bright Yellow
export COLOR_13="#B8BCD6"           # Bright Blue (Folder)
export COLOR_14="#D3B8D6"           # Bright Magenta
export COLOR_15="#B8D6D3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#09111A"   # Background
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
