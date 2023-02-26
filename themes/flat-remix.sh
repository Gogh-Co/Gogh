#!/usr/bin/env bash

export PROFILE_NAME="Flat Remix"

export COLOR_01="#1F2229"           # Black (Host)
export COLOR_02="#D41919"           # Red (Syntax string)
export COLOR_03="#5EBDAB"           # Green (Command)
export COLOR_04="#FEA44C"           # Yellow (Command second)
export COLOR_05="#367BF0"           # Blue (Path)
export COLOR_06="#BF2E5D"           # Magenta (Syntax var)
export COLOR_07="#49AEE6"           # Cyan (Prompt)
export COLOR_08="#E6E6E6"           # White

export COLOR_09="#8C42AB"           # Bright Black
export COLOR_10="#EC0101"           # Bright Red (Command error)
export COLOR_11="#47D4B9"           # Bright Green (Exec)
export COLOR_12="#FF8A18"           # Bright Yellow
export COLOR_13="#277FFF"           # Bright Blue (Folder)
export COLOR_14="#D71655"           # Bright Magenta
export COLOR_15="#05A1F7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#272A34"   # Background
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
