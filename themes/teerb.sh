#!/usr/bin/env bash

export PROFILE_NAME="Teerb"

export COLOR_01="#1C1C1C"           # Black (Host)
export COLOR_02="#D68686"           # Red (Syntax string)
export COLOR_03="#AED686"           # Green (Command)
export COLOR_04="#D7AF87"           # Yellow (Command second)
export COLOR_05="#86AED6"           # Blue (Path)
export COLOR_06="#D6AED6"           # Magenta (Syntax var)
export COLOR_07="#8ADBB4"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#1C1C1C"           # Bright Black
export COLOR_10="#D68686"           # Bright Red (Command error)
export COLOR_11="#AED686"           # Bright Green (Exec)
export COLOR_12="#E4C9AF"           # Bright Yellow
export COLOR_13="#86AED6"           # Bright Blue (Folder)
export COLOR_14="#D6AED6"           # Bright Magenta
export COLOR_15="#B1E7DD"           # Bright Cyan
export COLOR_16="#EFEFEF"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
