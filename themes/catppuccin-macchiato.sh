#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Macchiato"

export COLOR_01="#494D64"           # Black (Host)
export COLOR_02="#ED8796"           # Red (Syntax string)
export COLOR_03="#A6DA95"           # Green (Command)
export COLOR_04="#EED49F"           # Yellow (Command second)
export COLOR_05="#8AADF4"           # Blue (Path)
export COLOR_06="#F5BDE6"           # Magenta (Syntax var)
export COLOR_07="#8BD5CA"           # Cyan (Prompt)
export COLOR_08="#B8C0E0"           # White

export COLOR_09="#5B6078"           # Bright Black
export COLOR_10="#ED8796"           # Bright Red (Command error)
export COLOR_11="#A6DA95"           # Bright Green (Exec)
export COLOR_12="#EED49F"           # Bright Yellow
export COLOR_13="#8AADF4"           # Bright Blue (Folder)
export COLOR_14="#F5BDE6"           # Bright Magenta
export COLOR_15="#8BD5CA"           # Bright Cyan
export COLOR_16="#A5ADCB"           # Bright White

export BACKGROUND_COLOR="#24273A"   # Background
export FOREGROUND_COLOR="#CAD3F5"   # Foreground (Text)

export CURSOR_COLOR="#CAD3F5" # Cursor

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
