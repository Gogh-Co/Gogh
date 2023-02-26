#!/usr/bin/env bash

export PROFILE_NAME="Lunaria Eclipse"

export COLOR_01="#323F46"           # Black (Host)
export COLOR_02="#83615B"           # Red (Syntax string)
export COLOR_03="#7F9781"           # Green (Command)
export COLOR_04="#A69875"           # Yellow (Command second)
export COLOR_05="#53516F"           # Blue (Path)
export COLOR_06="#856880"           # Magenta (Syntax var)
export COLOR_07="#7D96B2"           # Cyan (Prompt)
export COLOR_08="#C9CDD7"           # White

export COLOR_09="#3D4950"           # Bright Black
export COLOR_10="#BA9088"           # Bright Red (Command error)
export COLOR_11="#BEDBC1"           # Bright Green (Exec)
export COLOR_12="#F1DFB4"           # Bright Yellow
export COLOR_13="#767495"           # Bright Blue (Folder)
export COLOR_14="#BE9CB8"           # Bright Magenta
export COLOR_15="#BCDBFF"           # Bright Cyan
export COLOR_16="#DFE2ED"           # Bright White

export BACKGROUND_COLOR="#323F46"   # Background
export FOREGROUND_COLOR="#C9CDD7"   # Foreground (Text)

export CURSOR_COLOR="#C9CDD7" # Cursor

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
