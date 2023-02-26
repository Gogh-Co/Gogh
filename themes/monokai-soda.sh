#!/usr/bin/env bash

export PROFILE_NAME="Monokai Soda"

export COLOR_01="#1a1a1a"           # Black (Host)
export COLOR_02="#f4005f"           # Red (Syntax string)
export COLOR_03="#98e024"           # Green (Command)
export COLOR_04="#fa8419"           # Yellow (Command second)
export COLOR_05="#9d65ff"           # Blue (Path)
export COLOR_06="#f4005f"           # Magenta (Syntax var)
export COLOR_07="#58d1eb"           # Cyan (Prompt)
export COLOR_08="#c4c5b5"           # White

export COLOR_09="#625e4c"           # Bright Black
export COLOR_10="#f4005f"           # Bright Red (Command error)
export COLOR_11="#98e024"           # Bright Green (Exec)
export COLOR_12="#e0d561"           # Bright Yellow
export COLOR_13="#9d65ff"           # Bright Blue (Folder)
export COLOR_14="#f4005f"           # Bright Magenta
export COLOR_15="#58d1eb"           # Bright Cyan
export COLOR_16="#f6f6ef"           # Bright White

export BACKGROUND_COLOR="#1a1a1a"   # Background
export FOREGROUND_COLOR="#c4c5b5"   # Foreground (Text)

export CURSOR_COLOR="#c4c5b5" # Cursor

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
