#!/usr/bin/env bash

export PROFILE_NAME="Rippedcasts"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#cdaf95"           # Red (Syntax string)
export COLOR_03="#a8ff60"           # Green (Command)
export COLOR_04="#bfbb1f"           # Yellow (Command second)
export COLOR_05="#75a5b0"           # Blue (Path)
export COLOR_06="#ff73fd"           # Magenta (Syntax var)
export COLOR_07="#5a647e"           # Cyan (Prompt)
export COLOR_08="#bfbfbf"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#eecbad"           # Bright Red (Command error)
export COLOR_11="#bcee68"           # Bright Green (Exec)
export COLOR_12="#e5e500"           # Bright Yellow
export COLOR_13="#86bdc9"           # Bright Blue (Folder)
export COLOR_14="#e500e5"           # Bright Magenta
export COLOR_15="#8c9bc4"           # Bright Cyan
export COLOR_16="#e5e5e5"           # Bright White

export BACKGROUND_COLOR="#2b2b2b"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
