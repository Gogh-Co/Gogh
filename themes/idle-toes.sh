#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#323232"           # HOST
export COLOR_02="#d25252"           # SYNTAX_STRING
export COLOR_03="#7fe173"           # COMMAND
export COLOR_04="#ffc66d"           # COMMAND_COLOR2
export COLOR_05="#4099ff"           # PATH
export COLOR_06="#f680ff"           # SYNTAX_VAR
export COLOR_07="#bed6ff"           # PROMP
export COLOR_08="#eeeeec"           #

export COLOR_09="#535353"           #
export COLOR_10="#f07070"           # COMMAND_ERROR
export COLOR_11="#9dff91"           # EXEC
export COLOR_12="#ffe48b"           #
export COLOR_13="#5eb7f7"           # FOLDER
export COLOR_14="#ff9dff"           #
export COLOR_15="#dcf4ff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#323232"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Idle Toes"
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
