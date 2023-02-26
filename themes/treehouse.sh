#!/usr/bin/env bash

export PROFILE_NAME="Treehouse"

export COLOR_01="#321300"           # Black (Host)
export COLOR_02="#B2270E"           # Red (Syntax string)
export COLOR_03="#44A900"           # Green (Command)
export COLOR_04="#AA820C"           # Yellow (Command second)
export COLOR_05="#58859A"           # Blue (Path)
export COLOR_06="#97363D"           # Magenta (Syntax var)
export COLOR_07="#B25A1E"           # Cyan (Prompt)
export COLOR_08="#786B53"           # White

export COLOR_09="#433626"           # Bright Black
export COLOR_10="#ED5D20"           # Bright Red (Command error)
export COLOR_11="#55F238"           # Bright Green (Exec)
export COLOR_12="#F2B732"           # Bright Yellow
export COLOR_13="#85CFED"           # Bright Blue (Folder)
export COLOR_14="#E14C5A"           # Bright Magenta
export COLOR_15="#F07D14"           # Bright Cyan
export COLOR_16="#FFC800"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#786B53"   # Foreground (Text)

export CURSOR_COLOR="#786B53" # Cursor

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
