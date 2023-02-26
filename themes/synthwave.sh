#!/usr/bin/env bash

export PROFILE_NAME="Synthwave"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#fe4450"           # Red (Syntax string)
export COLOR_03="#72f1b8"           # Green (Command)
export COLOR_04="#fede5d"           # Yellow (Command second)
export COLOR_05="#03edf9"           # Blue (Path)
export COLOR_06="#ff7edb"           # Magenta (Syntax var)
export COLOR_07="#03edf9"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#fe4450"           # Bright Red (Command error)
export COLOR_11="#72f1b8"           # Bright Green (Exec)
export COLOR_12="#fede5d"           # Bright Yellow
export COLOR_13="#03edf9"           # Bright Blue (Folder)
export COLOR_14="#ff7edb"           # Bright Magenta
export COLOR_15="#03edf9"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#262335"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#03edf9" # Cursor

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
