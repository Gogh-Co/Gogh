#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#15171c"           # HOST
export COLOR_02="#ec5f67"           # SYNTAX_STRING
export COLOR_03="#81a764"           # COMMAND
export COLOR_04="#fec254"           # COMMAND_COLOR2
export COLOR_05="#5486c0"           # PATH
export COLOR_06="#bf83c1"           # SYNTAX_VAR
export COLOR_07="#57c2c1"           # PROMP
export COLOR_08="#efece7"           #

export COLOR_09="#555555"           #
export COLOR_10="#ff6973"           # COMMAND_ERROR
export COLOR_11="#93d493"           # EXEC
export COLOR_12="#ffd256"           #
export COLOR_13="#4d84d1"           # FOLDER
export COLOR_14="#ff55ff"           #
export COLOR_15="#83e9e4"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#bdbaae"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="SpaceGray Eighties"
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
