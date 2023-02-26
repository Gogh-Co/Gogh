#!/usr/bin/env bash

export PROFILE_NAME="Twilight"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#c06d44"           # Red (Syntax string)
export COLOR_03="#afb97a"           # Green (Command)
export COLOR_04="#c2a86c"           # Yellow (Command second)
export COLOR_05="#44474a"           # Blue (Path)
export COLOR_06="#b4be7c"           # Magenta (Syntax var)
export COLOR_07="#778385"           # Cyan (Prompt)
export COLOR_08="#ffffd4"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#de7c4c"           # Bright Red (Command error)
export COLOR_11="#ccd88c"           # Bright Green (Exec)
export COLOR_12="#e2c47e"           # Bright Yellow
export COLOR_13="#5a5e62"           # Bright Blue (Folder)
export COLOR_14="#d0dc8e"           # Bright Magenta
export COLOR_15="#8a989b"           # Bright Cyan
export COLOR_16="#ffffd4"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#ffffd4"   # Foreground (Text)

export CURSOR_COLOR="#ffffd4" # Cursor

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
