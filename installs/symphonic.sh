#!/usr/bin/env bash

export PROFILE_NAME="Symphonic"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DC322F"           # Red (Syntax string)
export COLOR_03="#56DB3A"           # Green (Command)
export COLOR_04="#FF8400"           # Yellow (Command second)
export COLOR_05="#0084D4"           # Blue (Path)
export COLOR_06="#B729D9"           # Magenta (Syntax var)
export COLOR_07="#CCCCFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#1B1D21"           # Bright Black
export COLOR_10="#DC322F"           # Bright Red (Command error)
export COLOR_11="#56DB3A"           # Bright Green (Exec)
export COLOR_12="#FF8400"           # Bright Yellow
export COLOR_13="#0084D4"           # Bright Blue (Folder)
export COLOR_14="#B729D9"           # Bright Magenta
export COLOR_15="#CCCCFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
