#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C82828"           # Red (Syntax string)
export COLOR_03="#718C00"           # Green (Command)
export COLOR_04="#EAB700"           # Yellow (Command second)
export COLOR_05="#4171AE"           # Blue (Path)
export COLOR_06="#8959A8"           # Magenta (Syntax var)
export COLOR_07="#3E999F"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#C82828"           # Bright Red (Command error)
export COLOR_11="#708B00"           # Bright Green (Exec)
export COLOR_12="#E9B600"           # Bright Yellow
export COLOR_13="#4170AE"           # Bright Blue (Folder)
export COLOR_14="#8958A7"           # Bright Magenta
export COLOR_15="#3D999F"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#4D4D4C"   # Foreground (Text)

export CURSOR_COLOR="#4C4C4C" # Cursor

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
