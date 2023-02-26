#!/usr/bin/env bash

export PROFILE_NAME="Chalkboard"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#c37372"           # Red (Syntax string)
export COLOR_03="#72c373"           # Green (Command)
export COLOR_04="#c2c372"           # Yellow (Command second)
export COLOR_05="#7372c3"           # Blue (Path)
export COLOR_06="#c372c2"           # Magenta (Syntax var)
export COLOR_07="#72c2c3"           # Cyan (Prompt)
export COLOR_08="#d9d9d9"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#dbaaaa"           # Bright Red (Command error)
export COLOR_11="#aadbaa"           # Bright Green (Exec)
export COLOR_12="#dadbaa"           # Bright Yellow
export COLOR_13="#aaaadb"           # Bright Blue (Folder)
export COLOR_14="#dbaada"           # Bright Magenta
export COLOR_15="#aadadb"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#29262f"   # Background
export FOREGROUND_COLOR="#d9e6f2"   # Foreground (Text)

export CURSOR_COLOR="#d9e6f2" # Cursor

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
