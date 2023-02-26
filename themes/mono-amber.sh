#!/usr/bin/env bash

export PROFILE_NAME="Mono Amber"

export COLOR_01="#402500"           # Black (Host)
export COLOR_02="#FF9400"           # Red (Syntax string)
export COLOR_03="#FF9400"           # Green (Command)
export COLOR_04="#FF9400"           # Yellow (Command second)
export COLOR_05="#FF9400"           # Blue (Path)
export COLOR_06="#FF9400"           # Magenta (Syntax var)
export COLOR_07="#FF9400"           # Cyan (Prompt)
export COLOR_08="#FF9400"           # White

export COLOR_09="#FF9400"           # Bright Black
export COLOR_10="#FF9400"           # Bright Red (Command error)
export COLOR_11="#FF9400"           # Bright Green (Exec)
export COLOR_12="#FF9400"           # Bright Yellow
export COLOR_13="#FF9400"           # Bright Blue (Folder)
export COLOR_14="#FF9400"           # Bright Magenta
export COLOR_15="#FF9400"           # Bright Cyan
export COLOR_16="#FF9400"           # Bright White

export BACKGROUND_COLOR="#2B1900"   # Background
export FOREGROUND_COLOR="#FF9400"   # Foreground (Text)

export CURSOR_COLOR="#FF9400" # Cursor

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
