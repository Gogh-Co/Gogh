#!/usr/bin/env bash

export PROFILE_NAME="Cobalt 2"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#38DE21"           # Green (Command)
export COLOR_04="#FFE50A"           # Yellow (Command second)
export COLOR_05="#1460D2"           # Blue (Path)
export COLOR_06="#FF005D"           # Magenta (Syntax var)
export COLOR_07="#00BBBB"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#F40E17"           # Bright Red (Command error)
export COLOR_11="#3BD01D"           # Bright Green (Exec)
export COLOR_12="#EDC809"           # Bright Yellow
export COLOR_13="#5555FF"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#6AE3FA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#132738"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
