#!/usr/bin/env bash

export PROFILE_NAME="Frontend Fun Forrest"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D6262B"           # Red (Syntax string)
export COLOR_03="#919C00"           # Green (Command)
export COLOR_04="#BE8A13"           # Yellow (Command second)
export COLOR_05="#4699A3"           # Blue (Path)
export COLOR_06="#8D4331"           # Magenta (Syntax var)
export COLOR_07="#DA8213"           # Cyan (Prompt)
export COLOR_08="#DDC265"           # White

export COLOR_09="#7F6A55"           # Bright Black
export COLOR_10="#E55A1C"           # Bright Red (Command error)
export COLOR_11="#BFC65A"           # Bright Green (Exec)
export COLOR_12="#FFCB1B"           # Bright Yellow
export COLOR_13="#7CC9CF"           # Bright Blue (Folder)
export COLOR_14="#D26349"           # Bright Magenta
export COLOR_15="#E6A96B"           # Bright Cyan
export COLOR_16="#FFEAA3"           # Bright White

export BACKGROUND_COLOR="#251200"   # Background
export FOREGROUND_COLOR="#DEC165"   # Foreground (Text)

export CURSOR_COLOR="#DEC165" # Cursor

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
