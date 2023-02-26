#!/usr/bin/env bash

export PROFILE_NAME="Darkside"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E8341C"           # Red (Syntax string)
export COLOR_03="#68C256"           # Green (Command)
export COLOR_04="#F2D42C"           # Yellow (Command second)
export COLOR_05="#1C98E8"           # Blue (Path)
export COLOR_06="#8E69C9"           # Magenta (Syntax var)
export COLOR_07="#1C98E8"           # Cyan (Prompt)
export COLOR_08="#BABABA"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#E05A4F"           # Bright Red (Command error)
export COLOR_11="#77B869"           # Bright Green (Exec)
export COLOR_12="#EFD64B"           # Bright Yellow
export COLOR_13="#387CD3"           # Bright Blue (Folder)
export COLOR_14="#957BBE"           # Bright Magenta
export COLOR_15="#3D97E2"           # Bright Cyan
export COLOR_16="#BABABA"           # Bright White

export BACKGROUND_COLOR="#222324"   # Background
export FOREGROUND_COLOR="#BABABA"   # Foreground (Text)

export CURSOR_COLOR="#BABABA" # Cursor

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
