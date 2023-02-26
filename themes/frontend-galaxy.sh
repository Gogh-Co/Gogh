#!/usr/bin/env bash

export PROFILE_NAME="Frontend Galaxy"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#f9555f"           # Red (Syntax string)
export COLOR_03="#21b089"           # Green (Command)
export COLOR_04="#fef02a"           # Yellow (Command second)
export COLOR_05="#589df6"           # Blue (Path)
export COLOR_06="#944d95"           # Magenta (Syntax var)
export COLOR_07="#1f9ee7"           # Cyan (Prompt)
export COLOR_08="#bbbbbb"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#fa8c8f"           # Bright Red (Command error)
export COLOR_11="#35bb9a"           # Bright Green (Exec)
export COLOR_12="#ffff55"           # Bright Yellow
export COLOR_13="#589df6"           # Bright Blue (Folder)
export COLOR_14="#e75699"           # Bright Magenta
export COLOR_15="#3979bc"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#1d2837"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
