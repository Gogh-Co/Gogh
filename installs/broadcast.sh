#!/usr/bin/env bash

export PROFILE_NAME="Broadcast"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DA4939"           # Red (Syntax string)
export COLOR_03="#519F50"           # Green (Command)
export COLOR_04="#FFD24A"           # Yellow (Command second)
export COLOR_05="#6D9CBE"           # Blue (Path)
export COLOR_06="#D0D0FF"           # Magenta (Syntax var)
export COLOR_07="#6E9CBE"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#FF7B6B"           # Bright Red (Command error)
export COLOR_11="#83D182"           # Bright Green (Exec)
export COLOR_12="#FFFF7C"           # Bright Yellow
export COLOR_13="#9FCEF0"           # Bright Blue (Folder)
export COLOR_14="#FFFFFF"           # Bright Magenta
export COLOR_15="#A0CEF0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2B2B2B"   # Background
export FOREGROUND_COLOR="#E6E1DC"   # Foreground (Text)

export CURSOR_COLOR="#E6E1DC" # Cursor

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
