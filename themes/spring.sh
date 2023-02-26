#!/usr/bin/env bash

export PROFILE_NAME="Spring"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff4d83"           # Red (Syntax string)
export COLOR_03="#1f8c3b"           # Green (Command)
export COLOR_04="#1fc95b"           # Yellow (Command second)
export COLOR_05="#1dd3ee"           # Blue (Path)
export COLOR_06="#8959a8"           # Magenta (Syntax var)
export COLOR_07="#3e999f"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#ff0021"           # Bright Red (Command error)
export COLOR_11="#1fc231"           # Bright Green (Exec)
export COLOR_12="#d5b807"           # Bright Yellow
export COLOR_13="#15a9fd"           # Bright Blue (Folder)
export COLOR_14="#8959a8"           # Bright Magenta
export COLOR_15="#3e999f"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#0a1e24"   # Background
export FOREGROUND_COLOR="#ecf0c1"   # Foreground (Text)

export CURSOR_COLOR="#ecf0c1" # Cursor

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
