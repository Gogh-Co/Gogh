#!/usr/bin/env bash

export PROFILE_NAME="Sundried"

export COLOR_01="#302B2A"           # Black (Host)
export COLOR_02="#A7463D"           # Red (Syntax string)
export COLOR_03="#587744"           # Green (Command)
export COLOR_04="#9D602A"           # Yellow (Command second)
export COLOR_05="#485B98"           # Blue (Path)
export COLOR_06="#864651"           # Magenta (Syntax var)
export COLOR_07="#9C814F"           # Cyan (Prompt)
export COLOR_08="#C9C9C9"           # White

export COLOR_09="#4D4E48"           # Bright Black
export COLOR_10="#AA000C"           # Bright Red (Command error)
export COLOR_11="#128C21"           # Bright Green (Exec)
export COLOR_12="#FC6A21"           # Bright Yellow
export COLOR_13="#7999F7"           # Bright Blue (Folder)
export COLOR_14="#FD8AA1"           # Bright Magenta
export COLOR_15="#FAD484"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1818"   # Background
export FOREGROUND_COLOR="#C9C9C9"   # Foreground (Text)

export CURSOR_COLOR="#C9C9C9" # Cursor

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
