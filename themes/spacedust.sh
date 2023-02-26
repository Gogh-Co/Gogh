#!/usr/bin/env bash

export PROFILE_NAME="Spacedust"

export COLOR_01="#6e5346"           # Black (Host)
export COLOR_02="#e35b00"           # Red (Syntax string)
export COLOR_03="#5cab96"           # Green (Command)
export COLOR_04="#e3cd7b"           # Yellow (Command second)
export COLOR_05="#0f548b"           # Blue (Path)
export COLOR_06="#e35b00"           # Magenta (Syntax var)
export COLOR_07="#06afc7"           # Cyan (Prompt)
export COLOR_08="#f0f1ce"           # White

export COLOR_09="#684c31"           # Bright Black
export COLOR_10="#ff8a3a"           # Bright Red (Command error)
export COLOR_11="#aecab8"           # Bright Green (Exec)
export COLOR_12="#ffc878"           # Bright Yellow
export COLOR_13="#67a0ce"           # Bright Blue (Folder)
export COLOR_14="#ff8a3a"           # Bright Magenta
export COLOR_15="#83a7b4"           # Bright Cyan
export COLOR_16="#fefff1"           # Bright White

export BACKGROUND_COLOR="#0a1e24"   # Background
export FOREGROUND_COLOR="#ecf0c1"   # Foreground (Text)

export CURSOR_COLOR="#ecf0c1" # Cursor

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
