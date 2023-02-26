#!/usr/bin/env bash

export PROFILE_NAME="Aci"

export COLOR_01="#363636"           # Black (Host)
export COLOR_02="#FF0883"           # Red (Syntax string)
export COLOR_03="#83FF08"           # Green (Command)
export COLOR_04="#FF8308"           # Yellow (Command second)
export COLOR_05="#0883FF"           # Blue (Path)
export COLOR_06="#8308FF"           # Magenta (Syntax var)
export COLOR_07="#08FF83"           # Cyan (Prompt)
export COLOR_08="#B6B6B6"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#FF1E8E"           # Bright Red (Command error)
export COLOR_11="#8EFF1E"           # Bright Green (Exec)
export COLOR_12="#FF8E1E"           # Bright Yellow
export COLOR_13="#1E8EFF"           # Bright Blue (Folder)
export COLOR_14="#8E1EFF"           # Bright Magenta
export COLOR_15="#1EFF8E"           # Bright Cyan
export COLOR_16="#C2C2C2"           # Bright White

export BACKGROUND_COLOR="#0D1926"   # Background
export FOREGROUND_COLOR="#B4E1FD"   # Foreground (Text)

export CURSOR_COLOR="#B4E1FD" # Cursor

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
