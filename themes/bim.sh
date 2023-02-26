#!/usr/bin/env bash

export PROFILE_NAME="Bim"

export COLOR_01="#2C2423"           # Black (Host)
export COLOR_02="#F557A0"           # Red (Syntax string)
export COLOR_03="#A9EE55"           # Green (Command)
export COLOR_04="#F5A255"           # Yellow (Command second)
export COLOR_05="#5EA2EC"           # Blue (Path)
export COLOR_06="#A957EC"           # Magenta (Syntax var)
export COLOR_07="#5EEEA0"           # Cyan (Prompt)
export COLOR_08="#918988"           # White

export COLOR_09="#918988"           # Bright Black
export COLOR_10="#F579B2"           # Bright Red (Command error)
export COLOR_11="#BBEE78"           # Bright Green (Exec)
export COLOR_12="#F5B378"           # Bright Yellow
export COLOR_13="#81B3EC"           # Bright Blue (Folder)
export COLOR_14="#BB79EC"           # Bright Magenta
export COLOR_15="#81EEB2"           # Bright Cyan
export COLOR_16="#F5EEEC"           # Bright White

export BACKGROUND_COLOR="#012849"   # Background
export FOREGROUND_COLOR="#A9BED8"   # Foreground (Text)

export CURSOR_COLOR="#A9BED8" # Cursor

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
