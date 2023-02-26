#!/usr/bin/env bash

export PROFILE_NAME="Nep"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#dd6f00"           # Red (Syntax string)
export COLOR_03="#00dd6f"           # Green (Command)
export COLOR_04="#6fdd00"           # Yellow (Command second)
export COLOR_05="#6f00dd"           # Blue (Path)
export COLOR_06="#dd006f"           # Magenta (Syntax var)
export COLOR_07="#006fdd"           # Cyan (Prompt)
export COLOR_08="#f2f2f2"           # White

export COLOR_09="#7d7d7d"           # Bright Black
export COLOR_10="#ffb974"           # Bright Red (Command error)
export COLOR_11="#74ffb9"           # Bright Green (Exec)
export COLOR_12="#b9ff74"           # Bright Yellow
export COLOR_13="#b974ff"           # Bright Blue (Folder)
export COLOR_14="#ff74b9"           # Bright Magenta
export COLOR_15="#74b9ff"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#758480"   # Background
export FOREGROUND_COLOR="#23476a"   # Foreground (Text)

export CURSOR_COLOR="#23476a" # Cursor

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
