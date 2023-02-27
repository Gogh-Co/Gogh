#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox"

export COLOR_01="#FBF1C7"           # Black (Host)
export COLOR_02="#CC241D"           # Red (Syntax string)
export COLOR_03="#98971A"           # Green (Command)
export COLOR_04="#D79921"           # Yellow (Command second)
export COLOR_05="#458588"           # Blue (Path)
export COLOR_06="#B16286"           # Magenta (Syntax var)
export COLOR_07="#689D6A"           # Cyan (Prompt)
export COLOR_08="#7C6F64"           # White

export COLOR_09="#928374"           # Bright Black
export COLOR_10="#9D0006"           # Bright Red (Command error)
export COLOR_11="#79740E"           # Bright Green (Exec)
export COLOR_12="#B57614"           # Bright Yellow
export COLOR_13="#076678"           # Bright Blue (Folder)
export COLOR_14="#8F3F71"           # Bright Magenta
export COLOR_15="#427B58"           # Bright Cyan
export COLOR_16="#3C3836"           # Bright White

export BACKGROUND_COLOR="#FBF1C7"   # Background
export FOREGROUND_COLOR="#3C3836"   # Foreground (Text)

export CURSOR_COLOR="#3C3836" # Cursor

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
