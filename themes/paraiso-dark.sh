#!/usr/bin/env bash

export PROFILE_NAME="Paraiso Dark"

export COLOR_01="#2f1e2e"           # Black (Host)
export COLOR_02="#ef6155"           # Red (Syntax string)
export COLOR_03="#48b685"           # Green (Command)
export COLOR_04="#fec418"           # Yellow (Command second)
export COLOR_05="#06b6ef"           # Blue (Path)
export COLOR_06="#815ba4"           # Magenta (Syntax var)
export COLOR_07="#5bc4bf"           # Cyan (Prompt)
export COLOR_08="#a39e9b"           # White

export COLOR_09="#776e71"           # Bright Black
export COLOR_10="#ef6155"           # Bright Red (Command error)
export COLOR_11="#48b685"           # Bright Green (Exec)
export COLOR_12="#fec418"           # Bright Yellow
export COLOR_13="#06b6ef"           # Bright Blue (Folder)
export COLOR_14="#815ba4"           # Bright Magenta
export COLOR_15="#5bc4bf"           # Bright Cyan
export COLOR_16="#e7e9db"           # Bright White

export BACKGROUND_COLOR="#2f1e2e"   # Background
export FOREGROUND_COLOR="#a39e9b"   # Foreground (Text)

export CURSOR_COLOR="#a39e9b" # Cursor

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
