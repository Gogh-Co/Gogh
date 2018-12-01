#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1c1c1c"           # HOST
export COLOR_02="#d68686"           # SYNTAX_STRING
export COLOR_03="#aed686"           # COMMAND
export COLOR_04="#d7af87"           # COMMAND_COLOR2
export COLOR_05="#86aed6"           # PATH
export COLOR_06="#d6aed6"           # SYNTAX_VAR
export COLOR_07="#8adbb4"           # PROMP
export COLOR_08="#d0d0d0"           #

export COLOR_09="#1c1c1c"           #
export COLOR_10="#d68686"           # COMMAND_ERROR
export COLOR_11="#aed686"           # EXEC
export COLOR_12="#e4c9af"           #
export COLOR_13="#86aed6"           # FOLDER
export COLOR_14="#d6aed6"           #
export COLOR_15="#b1e7dd"           #
export COLOR_16="#efefef"           #

export BACKGROUND_COLOR="#262626"   # Background Color
export FOREGROUND_COLOR="#d0d0d0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Teerb"
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
