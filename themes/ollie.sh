#!/usr/bin/env bash

export PROFILE_NAME="Ollie"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ac2e31"           # Red (Syntax string)
export COLOR_03="#31ac61"           # Green (Command)
export COLOR_04="#ac4300"           # Yellow (Command second)
export COLOR_05="#2d57ac"           # Blue (Path)
export COLOR_06="#b08528"           # Magenta (Syntax var)
export COLOR_07="#1fa6ac"           # Cyan (Prompt)
export COLOR_08="#8a8eac"           # White

export COLOR_09="#5b3725"           # Bright Black
export COLOR_10="#ff3d48"           # Bright Red (Command error)
export COLOR_11="#3bff99"           # Bright Green (Exec)
export COLOR_12="#ff5e1e"           # Bright Yellow
export COLOR_13="#4488ff"           # Bright Blue (Folder)
export COLOR_14="#ffc21d"           # Bright Magenta
export COLOR_15="#1ffaff"           # Bright Cyan
export COLOR_16="#5b6ea7"           # Bright White

export BACKGROUND_COLOR="#222125"   # Background
export FOREGROUND_COLOR="#8a8dae"   # Foreground (Text)

export CURSOR_COLOR="#8a8dae" # Cursor

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
