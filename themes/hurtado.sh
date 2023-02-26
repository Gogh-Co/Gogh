#!/usr/bin/env bash

export PROFILE_NAME="Hurtado"

export COLOR_01="#575757"           # Black (Host)
export COLOR_02="#ff1b00"           # Red (Syntax string)
export COLOR_03="#a5e055"           # Green (Command)
export COLOR_04="#fbe74a"           # Yellow (Command second)
export COLOR_05="#496487"           # Blue (Path)
export COLOR_06="#fd5ff1"           # Magenta (Syntax var)
export COLOR_07="#86e9fe"           # Cyan (Prompt)
export COLOR_08="#cbcccb"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#d51d00"           # Bright Red (Command error)
export COLOR_11="#a5df55"           # Bright Green (Exec)
export COLOR_12="#fbe84a"           # Bright Yellow
export COLOR_13="#89beff"           # Bright Blue (Folder)
export COLOR_14="#c001c1"           # Bright Magenta
export COLOR_15="#86eafe"           # Bright Cyan
export COLOR_16="#dbdbdb"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#dbdbdb"   # Foreground (Text)

export CURSOR_COLOR="#dbdbdb" # Cursor

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
