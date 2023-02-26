#!/usr/bin/env bash

export PROFILE_NAME="Synthwave"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#FE4450"           # Red (Syntax string)
export COLOR_03="#72F1B8"           # Green (Command)
export COLOR_04="#FEDE5D"           # Yellow (Command second)
export COLOR_05="#03EDF9"           # Blue (Path)
export COLOR_06="#FF7EDB"           # Magenta (Syntax var)
export COLOR_07="#03EDF9"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#FE4450"           # Bright Red (Command error)
export COLOR_11="#72F1B8"           # Bright Green (Exec)
export COLOR_12="#FEDE5D"           # Bright Yellow
export COLOR_13="#03EDF9"           # Bright Blue (Folder)
export COLOR_14="#FF7EDB"           # Bright Magenta
export COLOR_15="#03EDF9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#262335"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#03EDF9" # Cursor

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
