#!/usr/bin/env bash

export PROFILE_NAME="Colorcli"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D70000"           # Red (Syntax string)
export COLOR_03="#5FAF00"           # Green (Command)
export COLOR_04="#5FAF00"           # Yellow (Command second)
export COLOR_05="#005F87"           # Blue (Path)
export COLOR_06="#D70000"           # Magenta (Syntax var)
export COLOR_07="#5F5F5F"           # Cyan (Prompt)
export COLOR_08="#E4E4E4"           # White

export COLOR_09="#5F5F5F"           # Bright Black
export COLOR_10="#D70000"           # Bright Red (Command error)
export COLOR_11="#5F5F5F"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0087AF"           # Bright Blue (Folder)
export COLOR_14="#0087AF"           # Bright Magenta
export COLOR_15="#0087AF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#005F87"   # Foreground (Text)

export CURSOR_COLOR="#005F87" # Cursor

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
