#!/usr/bin/env bash

export PROFILE_NAME="Modus Vivendi"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff5f59"           # Red (Syntax string)
export COLOR_03="#44bc44"           # Green (Command)
export COLOR_04="#d0bc00"           # Yellow (Command second)
export COLOR_05="#2fafff"           # Blue (Path)
export COLOR_06="#feacd0"           # Magenta (Syntax var)
export COLOR_07="#00d3d0"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#1e1e1e"           # Bright Black
export COLOR_10="#ff5f5f"           # Bright Red (Command error)
export COLOR_11="#44df44"           # Bright Green (Exec)
export COLOR_12="#efef00"           # Bright Yellow
export COLOR_13="#338fff"           # Bright Blue (Folder)
export COLOR_14="#ff66ff"           # Bright Magenta
export COLOR_15="#00eff0"           # Bright Cyan
export COLOR_16="#989898"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
