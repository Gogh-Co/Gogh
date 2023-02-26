#!/usr/bin/env bash

export PROFILE_NAME="Chalk"

export COLOR_01="#646464"           # Black (Host)
export COLOR_02="#F58E8E"           # Red (Syntax string)
export COLOR_03="#A9D3AB"           # Green (Command)
export COLOR_04="#FED37E"           # Yellow (Command second)
export COLOR_05="#7AABD4"           # Blue (Path)
export COLOR_06="#D6ADD5"           # Magenta (Syntax var)
export COLOR_07="#79D4D5"           # Cyan (Prompt)
export COLOR_08="#D4D4D4"           # White

export COLOR_09="#646464"           # Bright Black
export COLOR_10="#F58E8E"           # Bright Red (Command error)
export COLOR_11="#A9D3AB"           # Bright Green (Exec)
export COLOR_12="#FED37E"           # Bright Yellow
export COLOR_13="#7AABD4"           # Bright Blue (Folder)
export COLOR_14="#D6ADD5"           # Bright Magenta
export COLOR_15="#79D4D5"           # Bright Cyan
export COLOR_16="#D4D4D4"           # Bright White

export BACKGROUND_COLOR="#2D2D2D"   # Background
export FOREGROUND_COLOR="#D4D4D4"   # Foreground (Text)

export CURSOR_COLOR="#D4D4D4" # Cursor

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
