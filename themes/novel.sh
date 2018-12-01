#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#cc0000"           # SYNTAX_STRING
export COLOR_03="#009600"           # COMMAND
export COLOR_04="#d06b00"           # COMMAND_COLOR2
export COLOR_05="#0000cc"           # PATH
export COLOR_06="#cc00cc"           # SYNTAX_VAR
export COLOR_07="#0087cc"           # PROMP
export COLOR_08="#cccccc"           #

export COLOR_09="#808080"           #
export COLOR_10="#cc0000"           # COMMAND_ERROR
export COLOR_11="#009600"           # EXEC
export COLOR_12="#d06b00"           #
export COLOR_13="#0000cc"           # FOLDER
export COLOR_14="#cc00cc"           #
export COLOR_15="#0087cc"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#dfdbc3"   # Background Color
export FOREGROUND_COLOR="#3b2322"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Novel"
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
