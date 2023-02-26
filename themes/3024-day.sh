#!/usr/bin/env bash

export PROFILE_NAME="3024 Day"

export COLOR_01="#090300"           # Black (Host)
export COLOR_02="#db2d20"           # Red (Syntax string)
export COLOR_03="#01a252"           # Green (Command)
export COLOR_04="#fded02"           # Yellow (Command second)
export COLOR_05="#01a0e4"           # Blue (Path)
export COLOR_06="#a16a94"           # Magenta (Syntax var)
export COLOR_07="#b5e4f4"           # Cyan (Prompt)
export COLOR_08="#a5a2a2"           # White

export COLOR_09="#5c5855"           # Bright Black
export COLOR_10="#e8bbd0"           # Bright Red (Command error)
export COLOR_11="#3a3432"           # Bright Green (Exec)
export COLOR_12="#4a4543"           # Bright Yellow
export COLOR_13="#807d7c"           # Bright Blue (Folder)
export COLOR_14="#d6d5d4"           # Bright Magenta
export COLOR_15="#cdab53"           # Bright Cyan
export COLOR_16="#f7f7f7"           # Bright White

export BACKGROUND_COLOR="#f7f7f7"   # Background
export FOREGROUND_COLOR="#4a4543"   # Foreground (Text)

export CURSOR_COLOR="#4a4543" # Cursor

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
