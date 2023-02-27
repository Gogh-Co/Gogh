#!/usr/bin/env bash

export PROFILE_NAME="Spring"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF4D83"           # Red (Syntax string)
export COLOR_03="#1F8C3B"           # Green (Command)
export COLOR_04="#1FC95B"           # Yellow (Command second)
export COLOR_05="#1DD3EE"           # Blue (Path)
export COLOR_06="#8959A8"           # Magenta (Syntax var)
export COLOR_07="#3E999F"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF0021"           # Bright Red (Command error)
export COLOR_11="#1FC231"           # Bright Green (Exec)
export COLOR_12="#D5B807"           # Bright Yellow
export COLOR_13="#15A9FD"           # Bright Blue (Folder)
export COLOR_14="#8959A8"           # Bright Magenta
export COLOR_15="#3E999F"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A1E24"   # Background
export FOREGROUND_COLOR="#ECF0C1"   # Foreground (Text)

export CURSOR_COLOR="#ECF0C1" # Cursor

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
