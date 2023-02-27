#!/usr/bin/env bash

export PROFILE_NAME="Twilight"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#C06D44"           # Red (Syntax string)
export COLOR_03="#AFB97A"           # Green (Command)
export COLOR_04="#C2A86C"           # Yellow (Command second)
export COLOR_05="#44474A"           # Blue (Path)
export COLOR_06="#B4BE7C"           # Magenta (Syntax var)
export COLOR_07="#778385"           # Cyan (Prompt)
export COLOR_08="#FFFFD4"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#DE7C4C"           # Bright Red (Command error)
export COLOR_11="#CCD88C"           # Bright Green (Exec)
export COLOR_12="#E2C47E"           # Bright Yellow
export COLOR_13="#5A5E62"           # Bright Blue (Folder)
export COLOR_14="#D0DC8E"           # Bright Magenta
export COLOR_15="#8A989B"           # Bright Cyan
export COLOR_16="#FFFFD4"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#FFFFD4"   # Foreground (Text)

export CURSOR_COLOR="#FFFFD4" # Cursor

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
