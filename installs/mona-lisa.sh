#!/usr/bin/env bash

export PROFILE_NAME="Mona Lisa"

export COLOR_01="#351B0E"           # Black (Host)
export COLOR_02="#9B291C"           # Red (Syntax string)
export COLOR_03="#636232"           # Green (Command)
export COLOR_04="#C36E28"           # Yellow (Command second)
export COLOR_05="#515C5D"           # Blue (Path)
export COLOR_06="#9B1D29"           # Magenta (Syntax var)
export COLOR_07="#588056"           # Cyan (Prompt)
export COLOR_08="#F7D75C"           # White

export COLOR_09="#874228"           # Bright Black
export COLOR_10="#FF4331"           # Bright Red (Command error)
export COLOR_11="#B4B264"           # Bright Green (Exec)
export COLOR_12="#FF9566"           # Bright Yellow
export COLOR_13="#9EB2B4"           # Bright Blue (Folder)
export COLOR_14="#FF5B6A"           # Bright Magenta
export COLOR_15="#8ACD8F"           # Bright Cyan
export COLOR_16="#FFE598"           # Bright White

export BACKGROUND_COLOR="#120B0D"   # Background
export FOREGROUND_COLOR="#F7D66A"   # Foreground (Text)

export CURSOR_COLOR="#F7D66A" # Cursor

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
