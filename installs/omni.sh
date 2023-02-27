#!/usr/bin/env bash

export PROFILE_NAME="Omni"

export COLOR_01="#191622"           # Black (Host)
export COLOR_02="#E96379"           # Red (Syntax string)
export COLOR_03="#67E480"           # Green (Command)
export COLOR_04="#E89E64"           # Yellow (Command second)
export COLOR_05="#78D1E1"           # Blue (Path)
export COLOR_06="#988BC7"           # Magenta (Syntax var)
export COLOR_07="#FF79C6"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#E96379"           # Bright Red (Command error)
export COLOR_11="#67E480"           # Bright Green (Exec)
export COLOR_12="#E89E64"           # Bright Yellow
export COLOR_13="#78D1E1"           # Bright Blue (Folder)
export COLOR_14="#988BC7"           # Bright Magenta
export COLOR_15="#FF79C6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#191622"   # Background
export FOREGROUND_COLOR="#ABB2BF"   # Foreground (Text)

export CURSOR_COLOR="#ABB2BF" # Cursor

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
