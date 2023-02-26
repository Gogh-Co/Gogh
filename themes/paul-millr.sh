#!/usr/bin/env bash

export PROFILE_NAME="Paul Millr"

export COLOR_01="#2a2a2a"           # Black (Host)
export COLOR_02="#ff0000"           # Red (Syntax string)
export COLOR_03="#79ff0f"           # Green (Command)
export COLOR_04="#d3bf00"           # Yellow (Command second)
export COLOR_05="#396bd7"           # Blue (Path)
export COLOR_06="#b449be"           # Magenta (Syntax var)
export COLOR_07="#66ccff"           # Cyan (Prompt)
export COLOR_08="#bbbbbb"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#ff0080"           # Bright Red (Command error)
export COLOR_11="#66ff66"           # Bright Green (Exec)
export COLOR_12="#f3d64e"           # Bright Yellow
export COLOR_13="#709aed"           # Bright Blue (Folder)
export COLOR_14="#db67e6"           # Bright Magenta
export COLOR_15="#7adff2"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#f2f2f2"   # Foreground (Text)

export CURSOR_COLOR="#f2f2f2" # Cursor

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
