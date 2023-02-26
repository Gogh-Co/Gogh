#!/usr/bin/env bash

export PROFILE_NAME="Frontend Fun Forrest"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#d6262b"           # Red (Syntax string)
export COLOR_03="#919c00"           # Green (Command)
export COLOR_04="#be8a13"           # Yellow (Command second)
export COLOR_05="#4699a3"           # Blue (Path)
export COLOR_06="#8d4331"           # Magenta (Syntax var)
export COLOR_07="#da8213"           # Cyan (Prompt)
export COLOR_08="#ddc265"           # White

export COLOR_09="#7f6a55"           # Bright Black
export COLOR_10="#e55a1c"           # Bright Red (Command error)
export COLOR_11="#bfc65a"           # Bright Green (Exec)
export COLOR_12="#ffcb1b"           # Bright Yellow
export COLOR_13="#7cc9cf"           # Bright Blue (Folder)
export COLOR_14="#d26349"           # Bright Magenta
export COLOR_15="#e6a96b"           # Bright Cyan
export COLOR_16="#ffeaa3"           # Bright White

export BACKGROUND_COLOR="#251200"   # Background
export FOREGROUND_COLOR="#dec165"   # Foreground (Text)

export CURSOR_COLOR="#dec165" # Cursor

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
