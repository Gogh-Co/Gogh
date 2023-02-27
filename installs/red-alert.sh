#!/usr/bin/env bash

export PROFILE_NAME="Red Alert"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D62E4E"           # Red (Syntax string)
export COLOR_03="#71BE6B"           # Green (Command)
export COLOR_04="#BEB86B"           # Yellow (Command second)
export COLOR_05="#489BEE"           # Blue (Path)
export COLOR_06="#E979D7"           # Magenta (Syntax var)
export COLOR_07="#6BBEB8"           # Cyan (Prompt)
export COLOR_08="#D6D6D6"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#E02553"           # Bright Red (Command error)
export COLOR_11="#AFF08C"           # Bright Green (Exec)
export COLOR_12="#DFDDB7"           # Bright Yellow
export COLOR_13="#65AAF1"           # Bright Blue (Folder)
export COLOR_14="#DDB7DF"           # Bright Magenta
export COLOR_15="#B7DFDD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#762423"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
