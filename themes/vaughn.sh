#!/usr/bin/env bash

export PROFILE_NAME="Vaughn"

export COLOR_01="#25234f"           # Black (Host)
export COLOR_02="#705050"           # Red (Syntax string)
export COLOR_03="#60b48a"           # Green (Command)
export COLOR_04="#dfaf8f"           # Yellow (Command second)
export COLOR_05="#5555ff"           # Blue (Path)
export COLOR_06="#f08cc3"           # Magenta (Syntax var)
export COLOR_07="#8cd0d3"           # Cyan (Prompt)
export COLOR_08="#709080"           # White

export COLOR_09="#709080"           # Bright Black
export COLOR_10="#dca3a3"           # Bright Red (Command error)
export COLOR_11="#60b48a"           # Bright Green (Exec)
export COLOR_12="#f0dfaf"           # Bright Yellow
export COLOR_13="#5555ff"           # Bright Blue (Folder)
export COLOR_14="#ec93d3"           # Bright Magenta
export COLOR_15="#93e0e3"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#25234f"   # Background
export FOREGROUND_COLOR="#dcdccc"   # Foreground (Text)

export CURSOR_COLOR="#dcdccc" # Cursor

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
