#!/usr/bin/env bash

export PROFILE_NAME="Afterglow"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#a53c23"           # Red (Syntax string)
export COLOR_03="#7b9246"           # Green (Command)
export COLOR_04="#d3a04d"           # Yellow (Command second)
export COLOR_05="#6c99bb"           # Blue (Path)
export COLOR_06="#9f4e85"           # Magenta (Syntax var)
export COLOR_07="#7dd6cf"           # Cyan (Prompt)
export COLOR_08="#d0d0d0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#a53c23"           # Bright Red (Command error)
export COLOR_11="#7b9246"           # Bright Green (Exec)
export COLOR_12="#d3a04d"           # Bright Yellow
export COLOR_13="#547c99"           # Bright Blue (Folder)
export COLOR_14="#9f4e85"           # Bright Magenta
export COLOR_15="#7dd6cf"           # Bright Cyan
export COLOR_16="#f5f5f5"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#d0d0d0"   # Foreground (Text)

export CURSOR_COLOR="#d0d0d0" # Cursor

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
