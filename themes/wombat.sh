#!/usr/bin/env bash

export PROFILE_NAME="Wombat"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ff615a"           # Red (Syntax string)
export COLOR_03="#b1e969"           # Green (Command)
export COLOR_04="#ebd99c"           # Yellow (Command second)
export COLOR_05="#5da9f6"           # Blue (Path)
export COLOR_06="#e86aff"           # Magenta (Syntax var)
export COLOR_07="#82fff7"           # Cyan (Prompt)
export COLOR_08="#dedacf"           # White

export COLOR_09="#313131"           # Bright Black
export COLOR_10="#f58c80"           # Bright Red (Command error)
export COLOR_11="#ddf88f"           # Bright Green (Exec)
export COLOR_12="#eee5b2"           # Bright Yellow
export COLOR_13="#a5c7ff"           # Bright Blue (Folder)
export COLOR_14="#ddaaff"           # Bright Magenta
export COLOR_15="#b7fff9"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#171717"   # Background
export FOREGROUND_COLOR="#dedacf"   # Foreground (Text)

export CURSOR_COLOR="#dedacf" # Cursor

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
