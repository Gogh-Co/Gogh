#!/usr/bin/env bash

export PROFILE_NAME="Dehydration"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#ff5555"           # Red (Syntax string)
export COLOR_03="#5fd38d"           # Green (Command)
export COLOR_04="#ff9955"           # Yellow (Command second)
export COLOR_05="#3771c8"           # Blue (Path)
export COLOR_06="#bc5fd3"           # Magenta (Syntax var)
export COLOR_07="#5fd3bc"           # Cyan (Prompt)
export COLOR_08="#999999"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#ff8080"           # Bright Red (Command error)
export COLOR_11="#87deaa"           # Bright Green (Exec)
export COLOR_12="#ffb380"           # Bright Yellow
export COLOR_13="#5f8dd3"           # Bright Blue (Folder)
export COLOR_14="#cd87de"           # Bright Magenta
export COLOR_15="#87decd"           # Bright Cyan
export COLOR_16="#cccccc"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
export FOREGROUND_COLOR="#cccccc"   # Foreground (Text)

export CURSOR_COLOR="#cccccc" # Cursor

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
