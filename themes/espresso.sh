#!/usr/bin/env bash

export PROFILE_NAME="Espresso"

export COLOR_01="#353535"           # Black (Host)
export COLOR_02="#d25252"           # Red (Syntax string)
export COLOR_03="#a5c261"           # Green (Command)
export COLOR_04="#ffc66d"           # Yellow (Command second)
export COLOR_05="#6c99bb"           # Blue (Path)
export COLOR_06="#d197d9"           # Magenta (Syntax var)
export COLOR_07="#bed6ff"           # Cyan (Prompt)
export COLOR_08="#eeeeec"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#f00c0c"           # Bright Red (Command error)
export COLOR_11="#c2e075"           # Bright Green (Exec)
export COLOR_12="#e1e48b"           # Bright Yellow
export COLOR_13="#8ab7d9"           # Bright Blue (Folder)
export COLOR_14="#efb5f7"           # Bright Magenta
export COLOR_15="#dcf4ff"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#323232"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
