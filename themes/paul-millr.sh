#!/usr/bin/env bash

export PROFILE_NAME="Paul Millr"

export COLOR_01="#2A2A2A"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#79FF0F"           # Green (Command)
export COLOR_04="#D3BF00"           # Yellow (Command second)
export COLOR_05="#396BD7"           # Blue (Path)
export COLOR_06="#B449BE"           # Magenta (Syntax var)
export COLOR_07="#66CCFF"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF0080"           # Bright Red (Command error)
export COLOR_11="#66FF66"           # Bright Green (Exec)
export COLOR_12="#F3D64E"           # Bright Yellow
export COLOR_13="#709AED"           # Bright Blue (Folder)
export COLOR_14="#DB67E6"           # Bright Magenta
export COLOR_15="#7ADFF2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#F2F2F2"   # Foreground (Text)

export CURSOR_COLOR="#F2F2F2" # Cursor

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
