#!/usr/bin/env bash

export PROFILE_NAME="Nightlion V1"

export COLOR_01="#4C4C4C"           # Black (Host)
export COLOR_02="#BB0000"           # Red (Syntax string)
export COLOR_03="#5FDE8F"           # Green (Command)
export COLOR_04="#F3F167"           # Yellow (Command second)
export COLOR_05="#276BD8"           # Blue (Path)
export COLOR_06="#BB00BB"           # Magenta (Syntax var)
export COLOR_07="#00DADF"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#55FF55"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#5555FF"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#55FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
