#!/usr/bin/env bash

export PROFILE_NAME="Hurtado"

export COLOR_01="#575757"           # Black (Host)
export COLOR_02="#FF1B00"           # Red (Syntax string)
export COLOR_03="#A5E055"           # Green (Command)
export COLOR_04="#FBE74A"           # Yellow (Command second)
export COLOR_05="#496487"           # Blue (Path)
export COLOR_06="#FD5FF1"           # Magenta (Syntax var)
export COLOR_07="#86E9FE"           # Cyan (Prompt)
export COLOR_08="#CBCCCB"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#D51D00"           # Bright Red (Command error)
export COLOR_11="#A5DF55"           # Bright Green (Exec)
export COLOR_12="#FBE84A"           # Bright Yellow
export COLOR_13="#89BEFF"           # Bright Blue (Folder)
export COLOR_14="#C001C1"           # Bright Magenta
export COLOR_15="#86EAFE"           # Bright Cyan
export COLOR_16="#DBDBDB"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#DBDBDB"   # Foreground (Text)

export CURSOR_COLOR="#DBDBDB" # Cursor

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
