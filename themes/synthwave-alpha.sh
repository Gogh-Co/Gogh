#!/usr/bin/env bash

export PROFILE_NAME="Synthwave Alpha"

export COLOR_01="#241b30"           # Black (Host)
export COLOR_02="#9a0048"           # Red (Syntax string)
export COLOR_03="#00986c"           # Green (Command)
export COLOR_04="#adad3e"           # Yellow (Command second)
export COLOR_05="#6e29ad"           # Blue (Path)
export COLOR_06="#b300ad"           # Magenta (Syntax var)
export COLOR_07="#00b0b1"           # Cyan (Prompt)
export COLOR_08="#b9b1bc"           # White

export COLOR_09="#7f7094"           # Bright Black
export COLOR_10="#e60a70"           # Bright Red (Command error)
export COLOR_11="#0ae4a4"           # Bright Green (Exec)
export COLOR_12="#f9f972"           # Bright Yellow
export COLOR_13="#aa54f9"           # Bright Blue (Folder)
export COLOR_14="#ff00f6"           # Bright Magenta
export COLOR_15="#00fbfd"           # Bright Cyan
export COLOR_16="#f2f2e3"           # Bright White

export BACKGROUND_COLOR="#241b30"   # Background
export FOREGROUND_COLOR="#f2f2e3"   # Foreground (Text)

export CURSOR_COLOR="#f2f2e3" # Cursor

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
