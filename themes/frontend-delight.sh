#!/usr/bin/env bash

export PROFILE_NAME="Frontend Delight"

export COLOR_01="#242526"           # Black (Host)
export COLOR_02="#f8511b"           # Red (Syntax string)
export COLOR_03="#565747"           # Green (Command)
export COLOR_04="#fa771d"           # Yellow (Command second)
export COLOR_05="#2c70b7"           # Blue (Path)
export COLOR_06="#f02e4f"           # Magenta (Syntax var)
export COLOR_07="#3ca1a6"           # Cyan (Prompt)
export COLOR_08="#adadad"           # White

export COLOR_09="#5fac6d"           # Bright Black
export COLOR_10="#f74319"           # Bright Red (Command error)
export COLOR_11="#74ec4c"           # Bright Green (Exec)
export COLOR_12="#fdc325"           # Bright Yellow
export COLOR_13="#3393ca"           # Bright Blue (Folder)
export COLOR_14="#e75e4f"           # Bright Magenta
export COLOR_15="#4fbce6"           # Bright Cyan
export COLOR_16="#8c735b"           # Bright White

export BACKGROUND_COLOR="#1b1c1d"   # Background
export FOREGROUND_COLOR="#adadad"   # Foreground (Text)

export CURSOR_COLOR="#adadad" # Cursor

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
