#!/usr/bin/env bash

export PROFILE_NAME="3024 Night"

export COLOR_01="#090300"           # Black (Host)
export COLOR_02="#DB2D20"           # Red (Syntax string)
export COLOR_03="#01A252"           # Green (Command)
export COLOR_04="#FDED02"           # Yellow (Command second)
export COLOR_05="#01A0E4"           # Blue (Path)
export COLOR_06="#A16A94"           # Magenta (Syntax var)
export COLOR_07="#B5E4F4"           # Cyan (Prompt)
export COLOR_08="#A5A2A2"           # White

export COLOR_09="#5C5855"           # Bright Black
export COLOR_10="#E8BBD0"           # Bright Red (Command error)
export COLOR_11="#3A3432"           # Bright Green (Exec)
export COLOR_12="#4A4543"           # Bright Yellow
export COLOR_13="#807D7C"           # Bright Blue (Folder)
export COLOR_14="#D6D5D4"           # Bright Magenta
export COLOR_15="#CDAB53"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#090300"   # Background
export FOREGROUND_COLOR="#A5A2A2"   # Foreground (Text)

export CURSOR_COLOR="#A5A2A2" # Cursor

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
