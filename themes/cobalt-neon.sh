#!/usr/bin/env bash

export PROFILE_NAME="Cobalt Neon"

export COLOR_01="#142631"           # Black (Host)
export COLOR_02="#ff2320"           # Red (Syntax string)
export COLOR_03="#3ba5ff"           # Green (Command)
export COLOR_04="#e9e75c"           # Yellow (Command second)
export COLOR_05="#8ff586"           # Blue (Path)
export COLOR_06="#781aa0"           # Magenta (Syntax var)
export COLOR_07="#8ff586"           # Cyan (Prompt)
export COLOR_08="#ba46b2"           # White

export COLOR_09="#fff688"           # Bright Black
export COLOR_10="#d4312e"           # Bright Red (Command error)
export COLOR_11="#8ff586"           # Bright Green (Exec)
export COLOR_12="#e9f06d"           # Bright Yellow
export COLOR_13="#3c7dd2"           # Bright Blue (Folder)
export COLOR_14="#8230a7"           # Bright Magenta
export COLOR_15="#6cbc67"           # Bright Cyan
export COLOR_16="#8ff586"           # Bright White

export BACKGROUND_COLOR="#142838"   # Background
export FOREGROUND_COLOR="#8ff586"   # Foreground (Text)

export CURSOR_COLOR="#8ff586" # Cursor

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
