#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Ristretto"

export COLOR_01="#3E3838"           # Black (Host)
export COLOR_02="#DF7484"           # Red (Syntax string)
export COLOR_03="#BBD87E"           # Green (Command)
export COLOR_04="#EDCE73"           # Yellow (Command second)
export COLOR_05="#DC9373"           # Blue (Path)
export COLOR_06="#A9AAE9"           # Magenta (Syntax var)
export COLOR_07="#A4D7CC"           # Cyan (Prompt)
export COLOR_08="#FBF2F3"           # White

export COLOR_09="#70696A"           # Bright Black
export COLOR_10="#DF7484"           # Bright Red (Command error)
export COLOR_11="#BBD87E"           # Bright Green (Exec)
export COLOR_12="#EDCE73"           # Bright Yellow
export COLOR_13="#DC9373"           # Bright Blue (Folder)
export COLOR_14="#A9AAE9"           # Bright Magenta
export COLOR_15="#A4D7CC"           # Bright Cyan
export COLOR_16="#FBF2F3"           # Bright White

export BACKGROUND_COLOR="#3E3838"   # Background
export FOREGROUND_COLOR="#FBF2F3"   # Foreground (Text)

export CURSOR_COLOR="#FBF2F3" # Cursor

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
