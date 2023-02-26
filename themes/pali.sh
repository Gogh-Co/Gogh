#!/usr/bin/env bash

export PROFILE_NAME="Pali"

export COLOR_01="#0a0a0a"           # Black (Host)
export COLOR_02="#ab8f74"           # Red (Syntax string)
export COLOR_03="#74ab8f"           # Green (Command)
export COLOR_04="#8fab74"           # Yellow (Command second)
export COLOR_05="#8f74ab"           # Blue (Path)
export COLOR_06="#ab748f"           # Magenta (Syntax var)
export COLOR_07="#748fab"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#5D5D5D"           # Bright Black
export COLOR_10="#FF1D62"           # Bright Red (Command error)
export COLOR_11="#9cc3af"           # Bright Green (Exec)
export COLOR_12="#FFD00A"           # Bright Yellow
export COLOR_13="#af9cc3"           # Bright Blue (Folder)
export COLOR_14="#FF1D62"           # Bright Magenta
export COLOR_15="#4BB8FD"           # Bright Cyan
export COLOR_16="#A020F0"           # Bright White

export BACKGROUND_COLOR="#232E37"   # Background
export FOREGROUND_COLOR="#d9e6f2"   # Foreground (Text)

export CURSOR_COLOR="#d9e6f2" # Cursor

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
