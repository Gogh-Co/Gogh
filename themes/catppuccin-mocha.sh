#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Mocha"

export COLOR_01="#45475A"           # Black (Host)
export COLOR_02="#F38BA8"           # Red (Syntax string)
export COLOR_03="#A6E3A1"           # Green (Command)
export COLOR_04="#F9E2AF"           # Yellow (Command second)
export COLOR_05="#89B4FA"           # Blue (Path)
export COLOR_06="#F5C2E7"           # Magenta (Syntax var)
export COLOR_07="#94E2D5"           # Cyan (Prompt)
export COLOR_08="#BAC2DE"           # White

export COLOR_09="#585B70"           # Bright Black
export COLOR_10="#F38BA8"           # Bright Red (Command error)
export COLOR_11="#A6E3A1"           # Bright Green (Exec)
export COLOR_12="#F9E2AF"           # Bright Yellow
export COLOR_13="#89B4FA"           # Bright Blue (Folder)
export COLOR_14="#F5C2E7"           # Bright Magenta
export COLOR_15="#94E2D5"           # Bright Cyan
export COLOR_16="#A6ADC8"           # Bright White

export BACKGROUND_COLOR="#1E1E2E"   # Background
export FOREGROUND_COLOR="#CDD6F4"   # Foreground (Text)

export CURSOR_COLOR="#CDD6F4" # Cursor

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
