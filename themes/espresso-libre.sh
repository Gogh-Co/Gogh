#!/usr/bin/env bash

export PROFILE_NAME="Espresso Libre"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#cc0000"           # Red (Syntax string)
export COLOR_03="#1a921c"           # Green (Command)
export COLOR_04="#f0e53a"           # Yellow (Command second)
export COLOR_05="#0066ff"           # Blue (Path)
export COLOR_06="#c5656b"           # Magenta (Syntax var)
export COLOR_07="#06989a"           # Cyan (Prompt)
export COLOR_08="#d3d7cf"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#ef2929"           # Bright Red (Command error)
export COLOR_11="#9aff87"           # Bright Green (Exec)
export COLOR_12="#fffb5c"           # Bright Yellow
export COLOR_13="#43a8ed"           # Bright Blue (Folder)
export COLOR_14="#ff818a"           # Bright Magenta
export COLOR_15="#34e2e2"           # Bright Cyan
export COLOR_16="#eeeeec"           # Bright White

export BACKGROUND_COLOR="#2a211c"   # Background
export FOREGROUND_COLOR="#b8a898"   # Foreground (Text)

export CURSOR_COLOR="#b8a898" # Cursor

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
