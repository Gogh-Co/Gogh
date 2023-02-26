#!/usr/bin/env bash

export PROFILE_NAME="Wild Cherry"

export COLOR_01="#000507"           # Black (Host)
export COLOR_02="#d94085"           # Red (Syntax string)
export COLOR_03="#2ab250"           # Green (Command)
export COLOR_04="#ffd16f"           # Yellow (Command second)
export COLOR_05="#883cdc"           # Blue (Path)
export COLOR_06="#ececec"           # Magenta (Syntax var)
export COLOR_07="#c1b8b7"           # Cyan (Prompt)
export COLOR_08="#fff8de"           # White

export COLOR_09="#009cc9"           # Bright Black
export COLOR_10="#da6bac"           # Bright Red (Command error)
export COLOR_11="#f4dca5"           # Bright Green (Exec)
export COLOR_12="#eac066"           # Bright Yellow
export COLOR_13="#308cba"           # Bright Blue (Folder)
export COLOR_14="#ae636b"           # Bright Magenta
export COLOR_15="#ff919d"           # Bright Cyan
export COLOR_16="#e4838d"           # Bright White

export BACKGROUND_COLOR="#1f1726"   # Background
export FOREGROUND_COLOR="#dafaff"   # Foreground (Text)

export CURSOR_COLOR="#dafaff" # Cursor

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
