#!/usr/bin/env bash

export PROFILE_NAME="Vaughn"

export COLOR_01="#25234F"           # Black (Host)
export COLOR_02="#705050"           # Red (Syntax string)
export COLOR_03="#60B48A"           # Green (Command)
export COLOR_04="#DFAF8F"           # Yellow (Command second)
export COLOR_05="#5555FF"           # Blue (Path)
export COLOR_06="#F08CC3"           # Magenta (Syntax var)
export COLOR_07="#8CD0D3"           # Cyan (Prompt)
export COLOR_08="#709080"           # White

export COLOR_09="#709080"           # Bright Black
export COLOR_10="#DCA3A3"           # Bright Red (Command error)
export COLOR_11="#60B48A"           # Bright Green (Exec)
export COLOR_12="#F0DFAF"           # Bright Yellow
export COLOR_13="#5555FF"           # Bright Blue (Folder)
export COLOR_14="#EC93D3"           # Bright Magenta
export COLOR_15="#93E0E3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#25234F"   # Background
export FOREGROUND_COLOR="#DCDCCC"   # Foreground (Text)

export CURSOR_COLOR="#DCDCCC" # Cursor

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
