#!/usr/bin/env bash

export PROFILE_NAME="Novel"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#009600"           # Green (Command)
export COLOR_04="#D06B00"           # Yellow (Command second)
export COLOR_05="#0000CC"           # Blue (Path)
export COLOR_06="#CC00CC"           # Magenta (Syntax var)
export COLOR_07="#0087CC"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#CC0000"           # Bright Red (Command error)
export COLOR_11="#009600"           # Bright Green (Exec)
export COLOR_12="#D06B00"           # Bright Yellow
export COLOR_13="#0000CC"           # Bright Blue (Folder)
export COLOR_14="#CC00CC"           # Bright Magenta
export COLOR_15="#0087CC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#DFDBC3"   # Background
export FOREGROUND_COLOR="#3B2322"   # Foreground (Text)

export CURSOR_COLOR="#3B2322" # Cursor

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
