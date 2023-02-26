#!/usr/bin/env bash

export PROFILE_NAME="Nightlion V2"

export COLOR_01="#4c4c4c"           # Black (Host)
export COLOR_02="#bb0000"           # Red (Syntax string)
export COLOR_03="#04f623"           # Green (Command)
export COLOR_04="#f3f167"           # Yellow (Command second)
export COLOR_05="#64d0f0"           # Blue (Path)
export COLOR_06="#ce6fdb"           # Magenta (Syntax var)
export COLOR_07="#00dadf"           # Cyan (Prompt)
export COLOR_08="#bbbbbb"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#ff5555"           # Bright Red (Command error)
export COLOR_11="#7df71d"           # Bright Green (Exec)
export COLOR_12="#ffff55"           # Bright Yellow
export COLOR_13="#62cbe8"           # Bright Blue (Folder)
export COLOR_14="#ff9bf5"           # Bright Magenta
export COLOR_15="#00ccd8"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#171717"   # Background
export FOREGROUND_COLOR="#bbbbbb"   # Foreground (Text)

export CURSOR_COLOR="#bbbbbb" # Cursor

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
