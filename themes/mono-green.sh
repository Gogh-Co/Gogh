#!/usr/bin/env bash

export PROFILE_NAME="Mono Green"

export COLOR_01="#034000"           # Black (Host)
export COLOR_02="#0BFF00"           # Red (Syntax string)
export COLOR_03="#0BFF00"           # Green (Command)
export COLOR_04="#0BFF00"           # Yellow (Command second)
export COLOR_05="#0BFF00"           # Blue (Path)
export COLOR_06="#0BFF00"           # Magenta (Syntax var)
export COLOR_07="#0BFF00"           # Cyan (Prompt)
export COLOR_08="#0BFF00"           # White

export COLOR_09="#0BFF00"           # Bright Black
export COLOR_10="#0BFF00"           # Bright Red (Command error)
export COLOR_11="#0BFF00"           # Bright Green (Exec)
export COLOR_12="#0BFF00"           # Bright Yellow
export COLOR_13="#0BFF00"           # Bright Blue (Folder)
export COLOR_14="#0BFF00"           # Bright Magenta
export COLOR_15="#0BFF00"           # Bright Cyan
export COLOR_16="#0BFF00"           # Bright White

export BACKGROUND_COLOR="#022B00"   # Background
export FOREGROUND_COLOR="#0BFF00"   # Foreground (Text)

export CURSOR_COLOR="#0BFF00" # Cursor

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
