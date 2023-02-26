#!/usr/bin/env bash

export PROFILE_NAME="Rosé Pine"

export COLOR_01="#26233A"           # Black (Host)
export COLOR_02="#EB6F92"           # Red (Syntax string)
export COLOR_03="#9CCFD8"           # Green (Command)
export COLOR_04="#F6C177"           # Yellow (Command second)
export COLOR_05="#31748F"           # Blue (Path)
export COLOR_06="#C4A7E7"           # Magenta (Syntax var)
export COLOR_07="#EBBCBA"           # Cyan (Prompt)
export COLOR_08="#E0DEF4"           # White

export COLOR_09="#6E6A86"           # Bright Black
export COLOR_10="#EB6F92"           # Bright Red (Command error)
export COLOR_11="#9CCFD8"           # Bright Green (Exec)
export COLOR_12="#F6C177"           # Bright Yellow
export COLOR_13="#31748F"           # Bright Blue (Folder)
export COLOR_14="#C4A7E7"           # Bright Magenta
export COLOR_15="#EBBCBA"           # Bright Cyan
export COLOR_16="#E0DEF4"           # Bright White

export BACKGROUND_COLOR="#191724"   # Background
export FOREGROUND_COLOR="#E0DEF4"   # Foreground (Text)

export CURSOR_COLOR="#E0DEF4" # Cursor

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
