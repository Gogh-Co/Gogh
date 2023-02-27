#!/usr/bin/env bash

export PROFILE_NAME="Shel"

export COLOR_01="#2C2423"           # Black (Host)
export COLOR_02="#AB2463"           # Red (Syntax string)
export COLOR_03="#6CA323"           # Green (Command)
export COLOR_04="#AB6423"           # Yellow (Command second)
export COLOR_05="#2C64A2"           # Blue (Path)
export COLOR_06="#6C24A2"           # Magenta (Syntax var)
export COLOR_07="#2CA363"           # Cyan (Prompt)
export COLOR_08="#918988"           # White

export COLOR_09="#918988"           # Bright Black
export COLOR_10="#F588B9"           # Bright Red (Command error)
export COLOR_11="#C2EE86"           # Bright Green (Exec)
export COLOR_12="#F5BA86"           # Bright Yellow
export COLOR_13="#8FBAEC"           # Bright Blue (Folder)
export COLOR_14="#C288EC"           # Bright Magenta
export COLOR_15="#8FEEB9"           # Bright Cyan
export COLOR_16="#F5EEEC"           # Bright White

export BACKGROUND_COLOR="#2A201F"   # Background
export FOREGROUND_COLOR="#4882CD"   # Foreground (Text)

export CURSOR_COLOR="#4882CD" # Cursor

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
