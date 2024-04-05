#!/usr/bin/env bash

export PROFILE_NAME="Zenburn"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#cc9393"           # Red (Syntax string)
export COLOR_03="#efef87"           # Green (Command)
export COLOR_04="#ffd7a7"           # Yellow (Command second)
export COLOR_05="#c3bf97"           # Blue (Path)
export COLOR_06="#bca3a3"           # Magenta (Syntax var)
export COLOR_07="#93b3a3"           # Cyan (Prompt)
export COLOR_08="#f0efd0"           # White

export COLOR_09="#757575"           # Bright Black
export COLOR_10="#dfaf87"           # Bright Red (Command error)
export COLOR_11="#ffff87"           # Bright Green (Exec)
export COLOR_12="#ffcfaf"           # Bright Yellow
export COLOR_13="#d7d7af"           # Bright Blue (Folder)
export COLOR_14="#d7afaf"           # Bright Magenta
export COLOR_15="#93bea3"           # Bright Cyan
export COLOR_16="#dcdccc"           # Bright White

export BACKGROUND_COLOR="#3a3a3a"   # Background
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
