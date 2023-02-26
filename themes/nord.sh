#!/usr/bin/env bash

export PROFILE_NAME="Nord"

export COLOR_01="#3B4252"           # Black (Host)
export COLOR_02="#BF616A"           # Red (Syntax string)
export COLOR_03="#A3BE8C"           # Green (Command)
export COLOR_04="#EBCB8B"           # Yellow (Command second)
export COLOR_05="#81A1C1"           # Blue (Path)
export COLOR_06="#B48EAD"           # Magenta (Syntax var)
export COLOR_07="#88C0D0"           # Cyan (Prompt)
export COLOR_08="#E5E9F0"           # White

export COLOR_09="#4C566A"           # Bright Black
export COLOR_10="#BF616A"           # Bright Red (Command error)
export COLOR_11="#A3BE8C"           # Bright Green (Exec)
export COLOR_12="#EBCB8B"           # Bright Yellow
export COLOR_13="#81A1C1"           # Bright Blue (Folder)
export COLOR_14="#B48EAD"           # Bright Magenta
export COLOR_15="#8FBCBB"           # Bright Cyan
export COLOR_16="#ECEFF4"           # Bright White

export BACKGROUND_COLOR="#2E3440"   # Background
export FOREGROUND_COLOR="#D8DEE9"   # Foreground (Text)

export CURSOR_COLOR="#D8DEE9" # Cursor

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
