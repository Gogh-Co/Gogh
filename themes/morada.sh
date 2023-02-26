#!/usr/bin/env bash

export PROFILE_NAME="Morada"

export COLOR_01="#040404"           # Black (Host)
export COLOR_02="#0F49C4"           # Red (Syntax string)
export COLOR_03="#48B117"           # Green (Command)
export COLOR_04="#E87324"           # Yellow (Command second)
export COLOR_05="#BC0116"           # Blue (Path)
export COLOR_06="#665B93"           # Magenta (Syntax var)
export COLOR_07="#70A699"           # Cyan (Prompt)
export COLOR_08="#F5DCBE"           # White

export COLOR_09="#4F7CBF"           # Bright Black
export COLOR_10="#1C96C7"           # Bright Red (Command error)
export COLOR_11="#3BFF6F"           # Bright Green (Exec)
export COLOR_12="#EFC31C"           # Bright Yellow
export COLOR_13="#FB605B"           # Bright Blue (Folder)
export COLOR_14="#975B5A"           # Bright Magenta
export COLOR_15="#1EFF8E"           # Bright Cyan
export COLOR_16="#F6F5FB"           # Bright White

export BACKGROUND_COLOR="#211F46"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
