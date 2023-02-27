#!/usr/bin/env bash

export PROFILE_NAME="Predawn"

export COLOR_01="#F18260"           # Black (Host)
export COLOR_02="#B51A20"           # Red (Syntax string)
export COLOR_03="#A6CC75"           # Green (Command)
export COLOR_04="#FED33A"           # Yellow (Command second)
export COLOR_05="#81B2B1"           # Blue (Path)
export COLOR_06="#EB6C4E"           # Magenta (Syntax var)
export COLOR_07="#81B2B1"           # Cyan (Prompt)
export COLOR_08="#EAEAEA"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF000B"           # Bright Red (Command error)
export COLOR_11="#C4EE94"           # Bright Green (Exec)
export COLOR_12="#E8E06D"           # Bright Yellow
export COLOR_13="#A5EBEA"           # Bright Blue (Folder)
export COLOR_14="#EF8A50"           # Bright Magenta
export COLOR_15="#A5EBEA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#F1F1F1"   # Foreground (Text)

export CURSOR_COLOR="#F1F1F1" # Cursor

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
