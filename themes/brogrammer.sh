#!/usr/bin/env bash

export PROFILE_NAME="Brogrammer"

export COLOR_01="#1F1F1F"           # Black (Host)
export COLOR_02="#F81118"           # Red (Syntax string)
export COLOR_03="#2DC55E"           # Green (Command)
export COLOR_04="#ECBA0F"           # Yellow (Command second)
export COLOR_05="#2A84D2"           # Blue (Path)
export COLOR_06="#4E5AB7"           # Magenta (Syntax var)
export COLOR_07="#1081D6"           # Cyan (Prompt)
export COLOR_08="#D6DBE5"           # White

export COLOR_09="#D6DBE5"           # Bright Black
export COLOR_10="#DE352E"           # Bright Red (Command error)
export COLOR_11="#1DD361"           # Bright Green (Exec)
export COLOR_12="#F3BD09"           # Bright Yellow
export COLOR_13="#1081D6"           # Bright Blue (Folder)
export COLOR_14="#5350B9"           # Bright Magenta
export COLOR_15="#0F7DDB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#131313"   # Background
export FOREGROUND_COLOR="#D6DBE5"   # Foreground (Text)

export CURSOR_COLOR="#D6DBE5" # Cursor

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
