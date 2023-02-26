#!/usr/bin/env bash

export PROFILE_NAME="Night Owl"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#EF5350"           # Red (Syntax string)
export COLOR_03="#22da6e"           # Green (Command)
export COLOR_04="#addb67"           # Yellow (Command second)
export COLOR_05="#82aaff"           # Blue (Path)
export COLOR_06="#c792ea"           # Magenta (Syntax var)
export COLOR_07="#21c7a8"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#ef5350"           # Bright Red (Command error)
export COLOR_11="#22da6e"           # Bright Green (Exec)
export COLOR_12="#ffeb95"           # Bright Yellow
export COLOR_13="#82aaff"           # Bright Blue (Folder)
export COLOR_14="#c792ea"           # Bright Magenta
export COLOR_15="#7fdbca"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#011627"   # Background
export FOREGROUND_COLOR="#d6deeb"   # Foreground (Text)

export CURSOR_COLOR="#d6deeb" # Cursor

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
