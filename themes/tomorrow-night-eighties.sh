#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night Eighties"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F27779"           # Red (Syntax string)
export COLOR_03="#99CC99"           # Green (Command)
export COLOR_04="#FFCC66"           # Yellow (Command second)
export COLOR_05="#6699CC"           # Blue (Path)
export COLOR_06="#CC99CC"           # Magenta (Syntax var)
export COLOR_07="#66CCCC"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#F17779"           # Bright Red (Command error)
export COLOR_11="#99CC99"           # Bright Green (Exec)
export COLOR_12="#FFCC66"           # Bright Yellow
export COLOR_13="#6699CC"           # Bright Blue (Folder)
export COLOR_14="#CC99CC"           # Bright Magenta
export COLOR_15="#66CCCC"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#2C2C2C"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
