#!/usr/bin/env bash

export PROFILE_NAME="Highway"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#d00e18"           # Red (Syntax string)
export COLOR_03="#138034"           # Green (Command)
export COLOR_04="#ffcb3e"           # Yellow (Command second)
export COLOR_05="#006bb3"           # Blue (Path)
export COLOR_06="#6b2775"           # Magenta (Syntax var)
export COLOR_07="#384564"           # Cyan (Prompt)
export COLOR_08="#ededed"           # White

export COLOR_09="#5d504a"           # Bright Black
export COLOR_10="#f07e18"           # Bright Red (Command error)
export COLOR_11="#b1d130"           # Bright Green (Exec)
export COLOR_12="#fff120"           # Bright Yellow
export COLOR_13="#4fc2fd"           # Bright Blue (Folder)
export COLOR_14="#de0071"           # Bright Magenta
export COLOR_15="#5d504a"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#222225"   # Background
export FOREGROUND_COLOR="#ededed"   # Foreground (Text)

export CURSOR_COLOR="#ededed" # Cursor

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
