#!/usr/bin/env bash

export PROFILE_NAME="Borland"

export COLOR_01="#4f4f4f"           # Black (Host)
export COLOR_02="#ff6c60"           # Red (Syntax string)
export COLOR_03="#a8ff60"           # Green (Command)
export COLOR_04="#ffffb6"           # Yellow (Command second)
export COLOR_05="#96cbfe"           # Blue (Path)
export COLOR_06="#ff73fd"           # Magenta (Syntax var)
export COLOR_07="#c6c5fe"           # Cyan (Prompt)
export COLOR_08="#eeeeee"           # White

export COLOR_09="#7c7c7c"           # Bright Black
export COLOR_10="#ffb6b0"           # Bright Red (Command error)
export COLOR_11="#ceffac"           # Bright Green (Exec)
export COLOR_12="#ffffcc"           # Bright Yellow
export COLOR_13="#b5dcff"           # Bright Blue (Folder)
export COLOR_14="#ff9cfe"           # Bright Magenta
export COLOR_15="#dfdffe"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#0000a4"   # Background
export FOREGROUND_COLOR="#ffff4e"   # Foreground (Text)

export CURSOR_COLOR="#ffff4e" # Cursor

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
