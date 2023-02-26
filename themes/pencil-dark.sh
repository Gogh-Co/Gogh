#!/usr/bin/env bash

export PROFILE_NAME="Pencil Dark"

export COLOR_01="#212121"           # Black (Host)
export COLOR_02="#C30771"           # Red (Syntax string)
export COLOR_03="#10A778"           # Green (Command)
export COLOR_04="#A89C14"           # Yellow (Command second)
export COLOR_05="#008EC4"           # Blue (Path)
export COLOR_06="#523C79"           # Magenta (Syntax var)
export COLOR_07="#20A5BA"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#FB007A"           # Bright Red (Command error)
export COLOR_11="#5FD7AF"           # Bright Green (Exec)
export COLOR_12="#F3E430"           # Bright Yellow
export COLOR_13="#20BBFC"           # Bright Blue (Folder)
export COLOR_14="#6855DE"           # Bright Magenta
export COLOR_15="#4FB8CC"           # Bright Cyan
export COLOR_16="#F1F1F1"           # Bright White

export BACKGROUND_COLOR="#212121"   # Background
export FOREGROUND_COLOR="#F1F1F1"   # Foreground (Text)

export CURSOR_COLOR="#F1F1F1" # Cursor

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
