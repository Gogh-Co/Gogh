#!/usr/bin/env bash

export PROFILE_NAME="Ic Orange Ppl"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#c13900"           # Red (Syntax string)
export COLOR_03="#a4a900"           # Green (Command)
export COLOR_04="#caaf00"           # Yellow (Command second)
export COLOR_05="#bd6d00"           # Blue (Path)
export COLOR_06="#fc5e00"           # Magenta (Syntax var)
export COLOR_07="#f79500"           # Cyan (Prompt)
export COLOR_08="#ffc88a"           # White

export COLOR_09="#6a4f2a"           # Bright Black
export COLOR_10="#ff8c68"           # Bright Red (Command error)
export COLOR_11="#f6ff40"           # Bright Green (Exec)
export COLOR_12="#ffe36e"           # Bright Yellow
export COLOR_13="#ffbe55"           # Bright Blue (Folder)
export COLOR_14="#fc874f"           # Bright Magenta
export COLOR_15="#c69752"           # Bright Cyan
export COLOR_16="#fafaff"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#ffcb83"   # Foreground (Text)

export CURSOR_COLOR="#ffcb83" # Cursor

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
