#!/usr/bin/env bash

export PROFILE_NAME="Belafonte Night"

export COLOR_01="#20111b"           # Black (Host)
export COLOR_02="#be100e"           # Red (Syntax string)
export COLOR_03="#858162"           # Green (Command)
export COLOR_04="#eaa549"           # Yellow (Command second)
export COLOR_05="#426a79"           # Blue (Path)
export COLOR_06="#97522c"           # Magenta (Syntax var)
export COLOR_07="#989a9c"           # Cyan (Prompt)
export COLOR_08="#968c83"           # White

export COLOR_09="#5e5252"           # Bright Black
export COLOR_10="#be100e"           # Bright Red (Command error)
export COLOR_11="#858162"           # Bright Green (Exec)
export COLOR_12="#eaa549"           # Bright Yellow
export COLOR_13="#426a79"           # Bright Blue (Folder)
export COLOR_14="#97522c"           # Bright Magenta
export COLOR_15="#989a9c"           # Bright Cyan
export COLOR_16="#d5ccba"           # Bright White

export BACKGROUND_COLOR="#20111b"   # Background
export FOREGROUND_COLOR="#968c83"   # Foreground (Text)

export CURSOR_COLOR="#968c83" # Cursor

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
