#!/usr/bin/env bash

export PROFILE_NAME="Misterioso"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff4242"           # Red (Syntax string)
export COLOR_03="#74af68"           # Green (Command)
export COLOR_04="#ffad29"           # Yellow (Command second)
export COLOR_05="#338f86"           # Blue (Path)
export COLOR_06="#9414e6"           # Magenta (Syntax var)
export COLOR_07="#23d7d7"           # Cyan (Prompt)
export COLOR_08="#e1e1e0"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#ff3242"           # Bright Red (Command error)
export COLOR_11="#74cd68"           # Bright Green (Exec)
export COLOR_12="#ffb929"           # Bright Yellow
export COLOR_13="#23d7d7"           # Bright Blue (Folder)
export COLOR_14="#ff37ff"           # Bright Magenta
export COLOR_15="#00ede1"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#2d3743"   # Background
export FOREGROUND_COLOR="#e1e1e0"   # Foreground (Text)

export CURSOR_COLOR="#e1e1e0" # Cursor

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
