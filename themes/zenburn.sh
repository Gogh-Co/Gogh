#!/usr/bin/env bash

export PROFILE_NAME="Zenburn"

export COLOR_01="#4D4D4D"           # Black (Host)
export COLOR_02="#705050"           # Red (Syntax string)
export COLOR_03="#60B48A"           # Green (Command)
export COLOR_04="#F0DFAF"           # Yellow (Command second)
export COLOR_05="#506070"           # Blue (Path)
export COLOR_06="#DC8CC3"           # Magenta (Syntax var)
export COLOR_07="#8CD0D3"           # Cyan (Prompt)
export COLOR_08="#DCDCCC"           # White

export COLOR_09="#709080"           # Bright Black
export COLOR_10="#DCA3A3"           # Bright Red (Command error)
export COLOR_11="#C3BF9F"           # Bright Green (Exec)
export COLOR_12="#E0CF9F"           # Bright Yellow
export COLOR_13="#94BFF3"           # Bright Blue (Folder)
export COLOR_14="#EC93D3"           # Bright Magenta
export COLOR_15="#93E0E3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#3F3F3F"   # Background
export FOREGROUND_COLOR="#DCDCCC"   # Foreground (Text)

export CURSOR_COLOR="#DCDCCC" # Cursor

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
