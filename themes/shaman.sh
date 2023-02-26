#!/usr/bin/env bash

export PROFILE_NAME="Shaman"

export COLOR_01="#012026"           # Black (Host)
export COLOR_02="#b2302d"           # Red (Syntax string)
export COLOR_03="#00a941"           # Green (Command)
export COLOR_04="#5e8baa"           # Yellow (Command second)
export COLOR_05="#449a86"           # Blue (Path)
export COLOR_06="#00599d"           # Magenta (Syntax var)
export COLOR_07="#5d7e19"           # Cyan (Prompt)
export COLOR_08="#405555"           # White

export COLOR_09="#384451"           # Bright Black
export COLOR_10="#ff4242"           # Bright Red (Command error)
export COLOR_11="#2aea5e"           # Bright Green (Exec)
export COLOR_12="#8ed4fd"           # Bright Yellow
export COLOR_13="#61d5ba"           # Bright Blue (Folder)
export COLOR_14="#1298ff"           # Bright Magenta
export COLOR_15="#98d028"           # Bright Cyan
export COLOR_16="#58fbd6"           # Bright White

export BACKGROUND_COLOR="#001015"   # Background
export FOREGROUND_COLOR="#405555"   # Foreground (Text)

export CURSOR_COLOR="#405555" # Cursor

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
