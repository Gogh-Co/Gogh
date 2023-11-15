#!/usr/bin/env bash

export PROFILE_NAME="Selenized Light"

export COLOR_01="#fbf3db"           # Black (Host)
export COLOR_02="#d2212d"           # Red (Syntax string)
export COLOR_03="#489100"           # Green (Command)
export COLOR_04="#ad8900"           # Yellow (Command second)
export COLOR_05="#0072d4"           # Blue (Path)
export COLOR_06="#ca4898"           # Magenta (Syntax var)
export COLOR_07="#009c8f"           # Cyan (Prompt)
export COLOR_08="#53676d"           # White

export COLOR_09="#ece3cc"           # Bright Black
export COLOR_10="#cc1729"           # Bright Red (Command error)
export COLOR_11="#428b00"           # Bright Green (Exec)
export COLOR_12="#a78300"           # Bright Yellow
export COLOR_13="#006dce"           # Bright Blue (Folder)
export COLOR_14="#c44392"           # Bright Magenta
export COLOR_15="#00978a"           # Bright Cyan
export COLOR_16="#3a4d53"           # Bright White

export BACKGROUND_COLOR="#fbf3db"   # Background
export FOREGROUND_COLOR="#53676d"   # Foreground (Text)

export CURSOR_COLOR="#53676d" # Cursor

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
