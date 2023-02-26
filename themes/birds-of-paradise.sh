#!/usr/bin/env bash

export PROFILE_NAME="Birds Of Paradise"

export COLOR_01="#573d26"           # Black (Host)
export COLOR_02="#be2d26"           # Red (Syntax string)
export COLOR_03="#6ba18a"           # Green (Command)
export COLOR_04="#e99d2a"           # Yellow (Command second)
export COLOR_05="#5a86ad"           # Blue (Path)
export COLOR_06="#ac80a6"           # Magenta (Syntax var)
export COLOR_07="#74a6ad"           # Cyan (Prompt)
export COLOR_08="#e0dbb7"           # White

export COLOR_09="#9b6c4a"           # Bright Black
export COLOR_10="#e84627"           # Bright Red (Command error)
export COLOR_11="#95d8ba"           # Bright Green (Exec)
export COLOR_12="#d0d150"           # Bright Yellow
export COLOR_13="#b8d3ed"           # Bright Blue (Folder)
export COLOR_14="#d19ecb"           # Bright Magenta
export COLOR_15="#93cfd7"           # Bright Cyan
export COLOR_16="#fff9d5"           # Bright White

export BACKGROUND_COLOR="#2a1f1d"   # Background
export FOREGROUND_COLOR="#e0dbb7"   # Foreground (Text)

export CURSOR_COLOR="#e0dbb7" # Cursor

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
