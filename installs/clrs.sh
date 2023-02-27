#!/usr/bin/env bash

export PROFILE_NAME="Clrs"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F8282A"           # Red (Syntax string)
export COLOR_03="#328A5D"           # Green (Command)
export COLOR_04="#FA701D"           # Yellow (Command second)
export COLOR_05="#135CD0"           # Blue (Path)
export COLOR_06="#9F00BD"           # Magenta (Syntax var)
export COLOR_07="#33C3C1"           # Cyan (Prompt)
export COLOR_08="#B3B3B3"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FB0416"           # Bright Red (Command error)
export COLOR_11="#2CC631"           # Bright Green (Exec)
export COLOR_12="#FDD727"           # Bright Yellow
export COLOR_13="#1670FF"           # Bright Blue (Folder)
export COLOR_14="#E900B0"           # Bright Magenta
export COLOR_15="#3AD5CE"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#262626"   # Foreground (Text)

export CURSOR_COLOR="#262626" # Cursor

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
