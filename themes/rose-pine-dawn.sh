#!/usr/bin/env bash

export PROFILE_NAME="Rosé Pine Dawn"

export COLOR_01="#F2E9E1"           # Black (Host)
export COLOR_02="#B4637A"           # Red (Syntax string)
export COLOR_03="#56949F"           # Green (Command)
export COLOR_04="#EA9D34"           # Yellow (Command second)
export COLOR_05="#286983"           # Blue (Path)
export COLOR_06="#907AA9"           # Magenta (Syntax var)
export COLOR_07="#D7827E"           # Cyan (Prompt)
export COLOR_08="#575279"           # White

export COLOR_09="#9893A5"           # Bright Black
export COLOR_10="#B4637A"           # Bright Red (Command error)
export COLOR_11="#56949F"           # Bright Green (Exec)
export COLOR_12="#EA9D34"           # Bright Yellow
export COLOR_13="#286983"           # Bright Blue (Folder)
export COLOR_14="#907AA9"           # Bright Magenta
export COLOR_15="#D7827E"           # Bright Cyan
export COLOR_16="#575279"           # Bright White

export BACKGROUND_COLOR="#FAF4ED"   # Background
export FOREGROUND_COLOR="#575279"   # Foreground (Text)

export CURSOR_COLOR="#575279" # Cursor

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
