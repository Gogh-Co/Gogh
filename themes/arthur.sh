#!/usr/bin/env bash

export PROFILE_NAME="Arthur"

export COLOR_01="#3d352a"           # Black (Host)
export COLOR_02="#cd5c5c"           # Red (Syntax string)
export COLOR_03="#86af80"           # Green (Command)
export COLOR_04="#e8ae5b"           # Yellow (Command second)
export COLOR_05="#6495ed"           # Blue (Path)
export COLOR_06="#deb887"           # Magenta (Syntax var)
export COLOR_07="#b0c4de"           # Cyan (Prompt)
export COLOR_08="#bbaa99"           # White

export COLOR_09="#554444"           # Bright Black
export COLOR_10="#cc5533"           # Bright Red (Command error)
export COLOR_11="#88aa22"           # Bright Green (Exec)
export COLOR_12="#ffa75d"           # Bright Yellow
export COLOR_13="#87ceeb"           # Bright Blue (Folder)
export COLOR_14="#996600"           # Bright Magenta
export COLOR_15="#b0c4de"           # Bright Cyan
export COLOR_16="#ddccbb"           # Bright White

export BACKGROUND_COLOR="#1c1c1c"   # Background
export FOREGROUND_COLOR="#ddeedd"   # Foreground (Text)

export CURSOR_COLOR="#ddeedd" # Cursor

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
