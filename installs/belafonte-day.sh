#!/usr/bin/env bash

export PROFILE_NAME="Belafonte Day"

export COLOR_01="#20111B"           # Black (Host)
export COLOR_02="#BE100E"           # Red (Syntax string)
export COLOR_03="#858162"           # Green (Command)
export COLOR_04="#EAA549"           # Yellow (Command second)
export COLOR_05="#426A79"           # Blue (Path)
export COLOR_06="#97522C"           # Magenta (Syntax var)
export COLOR_07="#989A9C"           # Cyan (Prompt)
export COLOR_08="#968C83"           # White

export COLOR_09="#5E5252"           # Bright Black
export COLOR_10="#BE100E"           # Bright Red (Command error)
export COLOR_11="#858162"           # Bright Green (Exec)
export COLOR_12="#EAA549"           # Bright Yellow
export COLOR_13="#426A79"           # Bright Blue (Folder)
export COLOR_14="#97522C"           # Bright Magenta
export COLOR_15="#989A9C"           # Bright Cyan
export COLOR_16="#D5CCBA"           # Bright White

export BACKGROUND_COLOR="#D5CCBA"   # Background
export FOREGROUND_COLOR="#45373C"   # Foreground (Text)

export CURSOR_COLOR="#45373C" # Cursor

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
