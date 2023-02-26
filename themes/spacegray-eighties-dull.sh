#!/usr/bin/env bash

export PROFILE_NAME="Spacegray Eighties Dull"

export COLOR_01="#15171c"           # Black (Host)
export COLOR_02="#b24a56"           # Red (Syntax string)
export COLOR_03="#92b477"           # Green (Command)
export COLOR_04="#c6735a"           # Yellow (Command second)
export COLOR_05="#7c8fa5"           # Blue (Path)
export COLOR_06="#a5789e"           # Magenta (Syntax var)
export COLOR_07="#80cdcb"           # Cyan (Prompt)
export COLOR_08="#b3b8c3"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#ec5f67"           # Bright Red (Command error)
export COLOR_11="#89e986"           # Bright Green (Exec)
export COLOR_12="#fec254"           # Bright Yellow
export COLOR_13="#5486c0"           # Bright Blue (Folder)
export COLOR_14="#bf83c1"           # Bright Magenta
export COLOR_15="#58c2c1"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#c9c6bc"   # Foreground (Text)

export CURSOR_COLOR="#c9c6bc" # Cursor

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
