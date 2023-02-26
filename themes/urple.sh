#!/usr/bin/env bash

export PROFILE_NAME="Urple"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#b0425b"           # Red (Syntax string)
export COLOR_03="#37a415"           # Green (Command)
export COLOR_04="#ad5c42"           # Yellow (Command second)
export COLOR_05="#564d9b"           # Blue (Path)
export COLOR_06="#6c3ca1"           # Magenta (Syntax var)
export COLOR_07="#808080"           # Cyan (Prompt)
export COLOR_08="#87799c"           # White

export COLOR_09="#5d3225"           # Bright Black
export COLOR_10="#ff6388"           # Bright Red (Command error)
export COLOR_11="#29e620"           # Bright Green (Exec)
export COLOR_12="#f08161"           # Bright Yellow
export COLOR_13="#867aed"           # Bright Blue (Folder)
export COLOR_14="#a05eee"           # Bright Magenta
export COLOR_15="#eaeaea"           # Bright Cyan
export COLOR_16="#bfa3ff"           # Bright White

export BACKGROUND_COLOR="#1b1b23"   # Background
export FOREGROUND_COLOR="#877a9b"   # Foreground (Text)

export CURSOR_COLOR="#877a9b" # Cursor

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
