#!/usr/bin/env bash

export PROFILE_NAME="Wryan"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#8c4665"           # Red (Syntax string)
export COLOR_03="#287373"           # Green (Command)
export COLOR_04="#7c7c99"           # Yellow (Command second)
export COLOR_05="#395573"           # Blue (Path)
export COLOR_06="#5e468c"           # Magenta (Syntax var)
export COLOR_07="#31658c"           # Cyan (Prompt)
export COLOR_08="#899ca1"           # White

export COLOR_09="#3d3d3d"           # Bright Black
export COLOR_10="#bf4d80"           # Bright Red (Command error)
export COLOR_11="#53a6a6"           # Bright Green (Exec)
export COLOR_12="#9e9ecb"           # Bright Yellow
export COLOR_13="#477ab3"           # Bright Blue (Folder)
export COLOR_14="#7e62b3"           # Bright Magenta
export COLOR_15="#6096bf"           # Bright Cyan
export COLOR_16="#c0c0c0"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#999993"   # Foreground (Text)

export CURSOR_COLOR="#999993" # Cursor

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
