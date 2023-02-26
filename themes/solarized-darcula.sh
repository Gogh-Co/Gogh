#!/usr/bin/env bash

export PROFILE_NAME="Solarized Darcula"

export COLOR_01="#25292A"           # Black (Host)
export COLOR_02="#F24840"           # Red (Syntax string)
export COLOR_03="#629655"           # Green (Command)
export COLOR_04="#B68800"           # Yellow (Command second)
export COLOR_05="#2075C7"           # Blue (Path)
export COLOR_06="#797FD4"           # Magenta (Syntax var)
export COLOR_07="#15968D"           # Cyan (Prompt)
export COLOR_08="#D2D8D9"           # White

export COLOR_09="#25292A"           # Bright Black
export COLOR_10="#F24840"           # Bright Red (Command error)
export COLOR_11="#629655"           # Bright Green (Exec)
export COLOR_12="#B68800"           # Bright Yellow
export COLOR_13="#2075C7"           # Bright Blue (Folder)
export COLOR_14="#797FD4"           # Bright Magenta
export COLOR_15="#15968D"           # Bright Cyan
export COLOR_16="#D2D8D9"           # Bright White

export BACKGROUND_COLOR="#3D3F41"   # Background
export FOREGROUND_COLOR="#D2D8D9"   # Foreground (Text)

export CURSOR_COLOR="#D2D8D9" # Cursor

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
