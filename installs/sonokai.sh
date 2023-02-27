#!/usr/bin/env bash

export PROFILE_NAME="Sonokai"

export COLOR_01="#2C2E34"           # Black (Host)
export COLOR_02="#FC5D7C"           # Red (Syntax string)
export COLOR_03="#9ED072"           # Green (Command)
export COLOR_04="#E7C664"           # Yellow (Command second)
export COLOR_05="#F39660"           # Blue (Path)
export COLOR_06="#B39DF3"           # Magenta (Syntax var)
export COLOR_07="#76CCE0"           # Cyan (Prompt)
export COLOR_08="#E2E2E3"           # White

export COLOR_09="#7F8490"           # Bright Black
export COLOR_10="#FC5D7C"           # Bright Red (Command error)
export COLOR_11="#9ED072"           # Bright Green (Exec)
export COLOR_12="#E7C664"           # Bright Yellow
export COLOR_13="#F39660"           # Bright Blue (Folder)
export COLOR_14="#B39DF3"           # Bright Magenta
export COLOR_15="#76CCE0"           # Bright Cyan
export COLOR_16="#E2E2E3"           # Bright White

export BACKGROUND_COLOR="#2C2E34"   # Background
export FOREGROUND_COLOR="#E2E2E3"   # Foreground (Text)

export CURSOR_COLOR="#E2E2E3" # Cursor

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
