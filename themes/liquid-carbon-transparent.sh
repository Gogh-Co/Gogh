#!/usr/bin/env bash

export PROFILE_NAME="Liquid Carbon Transparent"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff3030"           # Red (Syntax string)
export COLOR_03="#559a70"           # Green (Command)
export COLOR_04="#ccac00"           # Yellow (Command second)
export COLOR_05="#0099cc"           # Blue (Path)
export COLOR_06="#cc69c8"           # Magenta (Syntax var)
export COLOR_07="#7ac4cc"           # Cyan (Prompt)
export COLOR_08="#bccccc"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#ff3030"           # Bright Red (Command error)
export COLOR_11="#559a70"           # Bright Green (Exec)
export COLOR_12="#ccac00"           # Bright Yellow
export COLOR_13="#0099cc"           # Bright Blue (Folder)
export COLOR_14="#cc69c8"           # Bright Magenta
export COLOR_15="#7ac4cc"           # Bright Cyan
export COLOR_16="#bccccc"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#afc2c2"   # Foreground (Text)

export CURSOR_COLOR="#afc2c2" # Cursor

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
