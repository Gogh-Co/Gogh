#!/usr/bin/env bash

export PROFILE_NAME="Flatland"

export COLOR_01="#1d1d19"           # Black (Host)
export COLOR_02="#f18339"           # Red (Syntax string)
export COLOR_03="#9fd364"           # Green (Command)
export COLOR_04="#f4ef6d"           # Yellow (Command second)
export COLOR_05="#5096be"           # Blue (Path)
export COLOR_06="#695abc"           # Magenta (Syntax var)
export COLOR_07="#d63865"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#1d1d19"           # Bright Black
export COLOR_10="#d22a24"           # Bright Red (Command error)
export COLOR_11="#a7d42c"           # Bright Green (Exec)
export COLOR_12="#ff8949"           # Bright Yellow
export COLOR_13="#61b9d0"           # Bright Blue (Folder)
export COLOR_14="#695abc"           # Bright Magenta
export COLOR_15="#d63865"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#1d1f21"   # Background
export FOREGROUND_COLOR="#b8dbef"   # Foreground (Text)

export CURSOR_COLOR="#b8dbef" # Cursor

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
