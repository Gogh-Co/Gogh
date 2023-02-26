#!/usr/bin/env bash

export PROFILE_NAME="Sundried"

export COLOR_01="#302b2a"           # Black (Host)
export COLOR_02="#a7463d"           # Red (Syntax string)
export COLOR_03="#587744"           # Green (Command)
export COLOR_04="#9d602a"           # Yellow (Command second)
export COLOR_05="#485b98"           # Blue (Path)
export COLOR_06="#864651"           # Magenta (Syntax var)
export COLOR_07="#9c814f"           # Cyan (Prompt)
export COLOR_08="#c9c9c9"           # White

export COLOR_09="#4d4e48"           # Bright Black
export COLOR_10="#aa000c"           # Bright Red (Command error)
export COLOR_11="#128c21"           # Bright Green (Exec)
export COLOR_12="#fc6a21"           # Bright Yellow
export COLOR_13="#7999f7"           # Bright Blue (Folder)
export COLOR_14="#fd8aa1"           # Bright Magenta
export COLOR_15="#fad484"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#1a1818"   # Background
export FOREGROUND_COLOR="#c9c9c9"   # Foreground (Text)

export CURSOR_COLOR="#c9c9c9" # Cursor

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
