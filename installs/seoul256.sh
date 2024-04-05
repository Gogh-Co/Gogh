#!/usr/bin/env bash

export PROFILE_NAME="Seoul256"

export COLOR_01="#4e4e4e"           # Black (Host)
export COLOR_02="#d68787"           # Red (Syntax string)
export COLOR_03="#5f865f"           # Green (Command)
export COLOR_04="#d8af5f"           # Yellow (Command second)
export COLOR_05="#85add4"           # Blue (Path)
export COLOR_06="#d7afaf"           # Magenta (Syntax var)
export COLOR_07="#87afaf"           # Cyan (Prompt)
export COLOR_08="#d0d0d0"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#d75f87"           # Bright Red (Command error)
export COLOR_11="#87af87"           # Bright Green (Exec)
export COLOR_12="#ffd787"           # Bright Yellow
export COLOR_13="#add4fb"           # Bright Blue (Folder)
export COLOR_14="#ffafaf"           # Bright Magenta
export COLOR_15="#87d7d7"           # Bright Cyan
export COLOR_16="#e4e4e4"           # Bright White

export BACKGROUND_COLOR="#3a3a3a"   # Background
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
