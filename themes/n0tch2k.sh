#!/usr/bin/env bash

export PROFILE_NAME="N0Tch2K"

export COLOR_01="#383838"           # Black (Host)
export COLOR_02="#a95551"           # Red (Syntax string)
export COLOR_03="#666666"           # Green (Command)
export COLOR_04="#a98051"           # Yellow (Command second)
export COLOR_05="#657d3e"           # Blue (Path)
export COLOR_06="#767676"           # Magenta (Syntax var)
export COLOR_07="#c9c9c9"           # Cyan (Prompt)
export COLOR_08="#d0b8a3"           # White

export COLOR_09="#474747"           # Bright Black
export COLOR_10="#a97775"           # Bright Red (Command error)
export COLOR_11="#8c8c8c"           # Bright Green (Exec)
export COLOR_12="#a99175"           # Bright Yellow
export COLOR_13="#98bd5e"           # Bright Blue (Folder)
export COLOR_14="#a3a3a3"           # Bright Magenta
export COLOR_15="#dcdcdc"           # Bright Cyan
export COLOR_16="#d8c8bb"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#a0a0a0"   # Foreground (Text)

export CURSOR_COLOR="#a0a0a0" # Cursor

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
