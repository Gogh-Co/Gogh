#!/usr/bin/env bash

export PROFILE_NAME="Ura"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#c21b6f"           # Red (Syntax string)
export COLOR_03="#6fc21b"           # Green (Command)
export COLOR_04="#c26f1b"           # Yellow (Command second)
export COLOR_05="#1b6fc2"           # Blue (Path)
export COLOR_06="#6f1bc2"           # Magenta (Syntax var)
export COLOR_07="#1bc26f"           # Cyan (Prompt)
export COLOR_08="#808080"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#ee84b9"           # Bright Red (Command error)
export COLOR_11="#b9ee84"           # Bright Green (Exec)
export COLOR_12="#eeb984"           # Bright Yellow
export COLOR_13="#84b9ee"           # Bright Blue (Folder)
export COLOR_14="#b984ee"           # Bright Magenta
export COLOR_15="#84eeb9"           # Bright Cyan
export COLOR_16="#e5e5e5"           # Bright White

export BACKGROUND_COLOR="#feffee"   # Background
export FOREGROUND_COLOR="#23476a"   # Foreground (Text)

export CURSOR_COLOR="#23476a" # Cursor

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
