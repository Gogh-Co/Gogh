#!/usr/bin/env bash

export PROFILE_NAME="Tokyo Night Light"

export COLOR_01="#0f0f14"           # Black (Host)
export COLOR_02="#8c4351"           # Red (Syntax string)
export COLOR_03="#485e30"           # Green (Command)
export COLOR_04="#8f5e15"           # Yellow (Command second)
export COLOR_05="#34548a"           # Blue (Path)
export COLOR_06="#5a4a78"           # Magenta (Syntax var)
export COLOR_07="#0f4b6e"           # Cyan (Prompt)
export COLOR_08="#343b58"           # White

export COLOR_09="#9699a3"           # Bright Black
export COLOR_10="#8c4351"           # Bright Red (Command error)
export COLOR_11="#485e30"           # Bright Green (Exec)
export COLOR_12="#8f5e15"           # Bright Yellow
export COLOR_13="#34548a"           # Bright Blue (Folder)
export COLOR_14="#5a4a78"           # Bright Magenta
export COLOR_15="#0f4b6e"           # Bright Cyan
export COLOR_16="#343b58"           # Bright White

export BACKGROUND_COLOR="#d5d6db"   # Background
export FOREGROUND_COLOR="#565a6e"   # Foreground (Text)

export CURSOR_COLOR="#565a6e" # Cursor

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
