#!/usr/bin/env bash

export PROFILE_NAME="Tin"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#8d534e"           # Red (Syntax string)
export COLOR_03="#4e8d53"           # Green (Command)
export COLOR_04="#888d4e"           # Yellow (Command second)
export COLOR_05="#534e8d"           # Blue (Path)
export COLOR_06="#8d4e88"           # Magenta (Syntax var)
export COLOR_07="#4e888d"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#b57d78"           # Bright Red (Command error)
export COLOR_11="#78b57d"           # Bright Green (Exec)
export COLOR_12="#b0b578"           # Bright Yellow
export COLOR_13="#7d78b5"           # Bright Blue (Folder)
export COLOR_14="#b578b0"           # Bright Magenta
export COLOR_15="#78b0b5"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#2e2e35"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
