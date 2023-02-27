#!/usr/bin/env bash

export PROFILE_NAME="Spacegray Eighties Dull"

export COLOR_01="#15171C"           # Black (Host)
export COLOR_02="#B24A56"           # Red (Syntax string)
export COLOR_03="#92B477"           # Green (Command)
export COLOR_04="#C6735A"           # Yellow (Command second)
export COLOR_05="#7C8FA5"           # Blue (Path)
export COLOR_06="#A5789E"           # Magenta (Syntax var)
export COLOR_07="#80CDCB"           # Cyan (Prompt)
export COLOR_08="#B3B8C3"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#EC5F67"           # Bright Red (Command error)
export COLOR_11="#89E986"           # Bright Green (Exec)
export COLOR_12="#FEC254"           # Bright Yellow
export COLOR_13="#5486C0"           # Bright Blue (Folder)
export COLOR_14="#BF83C1"           # Bright Magenta
export COLOR_15="#58C2C1"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C9C6BC"   # Foreground (Text)

export CURSOR_COLOR="#C9C6BC" # Cursor

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
