#!/usr/bin/env bash

export PROFILE_NAME="One Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DA3E39"           # Red (Syntax string)
export COLOR_03="#41933E"           # Green (Command)
export COLOR_04="#855504"           # Yellow (Command second)
export COLOR_05="#315EEE"           # Blue (Path)
export COLOR_06="#930092"           # Magenta (Syntax var)
export COLOR_07="#0E6FAD"           # Cyan (Prompt)
export COLOR_08="#8E8F96"           # White

export COLOR_09="#2A2B32"           # Bright Black
export COLOR_10="#DA3E39"           # Bright Red (Command error)
export COLOR_11="#41933E"           # Bright Green (Exec)
export COLOR_12="#855504"           # Bright Yellow
export COLOR_13="#315EEE"           # Bright Blue (Folder)
export COLOR_14="#930092"           # Bright Magenta
export COLOR_15="#0E6FAD"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#F8F8F8"   # Background
export FOREGROUND_COLOR="#2A2B32"   # Foreground (Text)

export CURSOR_COLOR="#2A2B32" # Cursor

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
