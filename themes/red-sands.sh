#!/usr/bin/env bash

export PROFILE_NAME="Red Sands"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff3f00"           # Red (Syntax string)
export COLOR_03="#00bb00"           # Green (Command)
export COLOR_04="#e7b000"           # Yellow (Command second)
export COLOR_05="#0072ff"           # Blue (Path)
export COLOR_06="#bb00bb"           # Magenta (Syntax var)
export COLOR_07="#00bbbb"           # Cyan (Prompt)
export COLOR_08="#bbbbbb"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#bb0000"           # Bright Red (Command error)
export COLOR_11="#00bb00"           # Bright Green (Exec)
export COLOR_12="#e7b000"           # Bright Yellow
export COLOR_13="#0072ae"           # Bright Blue (Folder)
export COLOR_14="#ff55ff"           # Bright Magenta
export COLOR_15="#55ffff"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#7a251e"   # Background
export FOREGROUND_COLOR="#d7c9a7"   # Foreground (Text)

export CURSOR_COLOR="#d7c9a7" # Cursor

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
