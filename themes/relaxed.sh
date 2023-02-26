#!/usr/bin/env bash

export PROFILE_NAME="Relaxed"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#BC5653"           # Red (Syntax string)
export COLOR_03="#909D63"           # Green (Command)
export COLOR_04="#EBC17A"           # Yellow (Command second)
export COLOR_05="#6A8799"           # Blue (Path)
export COLOR_06="#B06698"           # Magenta (Syntax var)
export COLOR_07="#C9DFFF"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#636363"           # Bright Black
export COLOR_10="#BC5653"           # Bright Red (Command error)
export COLOR_11="#A0AC77"           # Bright Green (Exec)
export COLOR_12="#EBC17A"           # Bright Yellow
export COLOR_13="#7EAAC7"           # Bright Blue (Folder)
export COLOR_14="#B06698"           # Bright Magenta
export COLOR_15="#ACBBD0"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#353A44"   # Background
export FOREGROUND_COLOR="#D9D9D9"   # Foreground (Text)

export CURSOR_COLOR="#D9D9D9" # Cursor

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
