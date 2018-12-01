#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#15171c"           # HOST
export COLOR_02="#b24a56"           # SYNTAX_STRING
export COLOR_03="#92b477"           # COMMAND
export COLOR_04="#c6735a"           # COMMAND_COLOR2
export COLOR_05="#7c8fa5"           # PATH
export COLOR_06="#a5789e"           # SYNTAX_VAR
export COLOR_07="#80cdcb"           # PROMP
export COLOR_08="#b3b8c3"           #

export COLOR_09="#555555"           #
export COLOR_10="#ec5f67"           # COMMAND_ERROR
export COLOR_11="#89e986"           # EXEC
export COLOR_12="#fec254"           #
export COLOR_13="#5486c0"           # FOLDER
export COLOR_14="#bf83c1"           #
export COLOR_15="#58c2c1"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#c9c6bc"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="SpaceGray Eighties Dull"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


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
