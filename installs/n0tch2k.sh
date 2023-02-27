#!/usr/bin/env bash

export PROFILE_NAME="N0Tch2K"

export COLOR_01="#383838"           # Black (Host)
export COLOR_02="#A95551"           # Red (Syntax string)
export COLOR_03="#666666"           # Green (Command)
export COLOR_04="#A98051"           # Yellow (Command second)
export COLOR_05="#657D3E"           # Blue (Path)
export COLOR_06="#767676"           # Magenta (Syntax var)
export COLOR_07="#C9C9C9"           # Cyan (Prompt)
export COLOR_08="#D0B8A3"           # White

export COLOR_09="#474747"           # Bright Black
export COLOR_10="#A97775"           # Bright Red (Command error)
export COLOR_11="#8C8C8C"           # Bright Green (Exec)
export COLOR_12="#A99175"           # Bright Yellow
export COLOR_13="#98BD5E"           # Bright Blue (Folder)
export COLOR_14="#A3A3A3"           # Bright Magenta
export COLOR_15="#DCDCDC"           # Bright Cyan
export COLOR_16="#D8C8BB"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#A0A0A0"   # Foreground (Text)

export CURSOR_COLOR="#A0A0A0" # Cursor

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
