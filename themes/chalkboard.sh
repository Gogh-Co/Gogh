#!/usr/bin/env bash

export PROFILE_NAME="Chalkboard"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C37372"           # Red (Syntax string)
export COLOR_03="#72C373"           # Green (Command)
export COLOR_04="#C2C372"           # Yellow (Command second)
export COLOR_05="#7372C3"           # Blue (Path)
export COLOR_06="#C372C2"           # Magenta (Syntax var)
export COLOR_07="#72C2C3"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#DBAAAA"           # Bright Red (Command error)
export COLOR_11="#AADBAA"           # Bright Green (Exec)
export COLOR_12="#DADBAA"           # Bright Yellow
export COLOR_13="#AAAADB"           # Bright Blue (Folder)
export COLOR_14="#DBAADA"           # Bright Magenta
export COLOR_15="#AADADB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#29262F"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
