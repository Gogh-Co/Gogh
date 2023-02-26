#!/usr/bin/env bash

export PROFILE_NAME="Ir Black"

export COLOR_01="#4E4E4E"           # Black (Host)
export COLOR_02="#FF6C60"           # Red (Syntax string)
export COLOR_03="#A8FF60"           # Green (Command)
export COLOR_04="#FFFFB6"           # Yellow (Command second)
export COLOR_05="#69CBFE"           # Blue (Path)
export COLOR_06="#FF73FD"           # Magenta (Syntax var)
export COLOR_07="#C6C5FE"           # Cyan (Prompt)
export COLOR_08="#EEEEEE"           # White

export COLOR_09="#7C7C7C"           # Bright Black
export COLOR_10="#FFB6B0"           # Bright Red (Command error)
export COLOR_11="#CEFFAC"           # Bright Green (Exec)
export COLOR_12="#FFFFCB"           # Bright Yellow
export COLOR_13="#B5DCFE"           # Bright Blue (Folder)
export COLOR_14="#FF9CFE"           # Bright Magenta
export COLOR_15="#DFDFFE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#EEEEEE"   # Foreground (Text)

export CURSOR_COLOR="#FFA560" # Cursor

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
