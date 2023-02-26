#!/usr/bin/env bash

export PROFILE_NAME="Kibble"

export COLOR_01="#4d4d4d"           # Black (Host)
export COLOR_02="#c70031"           # Red (Syntax string)
export COLOR_03="#29cf13"           # Green (Command)
export COLOR_04="#d8e30e"           # Yellow (Command second)
export COLOR_05="#3449d1"           # Blue (Path)
export COLOR_06="#8400ff"           # Magenta (Syntax var)
export COLOR_07="#0798ab"           # Cyan (Prompt)
export COLOR_08="#e2d1e3"           # White

export COLOR_09="#5a5a5a"           # Bright Black
export COLOR_10="#f01578"           # Bright Red (Command error)
export COLOR_11="#6ce05c"           # Bright Green (Exec)
export COLOR_12="#f3f79e"           # Bright Yellow
export COLOR_13="#97a4f7"           # Bright Blue (Folder)
export COLOR_14="#c495f0"           # Bright Magenta
export COLOR_15="#68f2e0"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#0e100a"   # Background
export FOREGROUND_COLOR="#f7f7f7"   # Foreground (Text)

export CURSOR_COLOR="#f7f7f7" # Cursor

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
