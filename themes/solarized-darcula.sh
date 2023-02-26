#!/usr/bin/env bash

export PROFILE_NAME="Solarized Darcula"

export COLOR_01="#25292a"           # Black (Host)
export COLOR_02="#f24840"           # Red (Syntax string)
export COLOR_03="#629655"           # Green (Command)
export COLOR_04="#b68800"           # Yellow (Command second)
export COLOR_05="#2075c7"           # Blue (Path)
export COLOR_06="#797fd4"           # Magenta (Syntax var)
export COLOR_07="#15968d"           # Cyan (Prompt)
export COLOR_08="#d2d8d9"           # White

export COLOR_09="#25292a"           # Bright Black
export COLOR_10="#f24840"           # Bright Red (Command error)
export COLOR_11="#629655"           # Bright Green (Exec)
export COLOR_12="#b68800"           # Bright Yellow
export COLOR_13="#2075c7"           # Bright Blue (Folder)
export COLOR_14="#797fd4"           # Bright Magenta
export COLOR_15="#15968d"           # Bright Cyan
export COLOR_16="#d2d8d9"           # Bright White

export BACKGROUND_COLOR="#3d3f41"   # Background
export FOREGROUND_COLOR="#d2d8d9"   # Foreground (Text)

export CURSOR_COLOR="#d2d8d9" # Cursor

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
