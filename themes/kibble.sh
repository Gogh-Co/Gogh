#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4d4d4d"           # HOST
export COLOR_02="#c70031"           # SYNTAX_STRING
export COLOR_03="#29cf13"           # COMMAND
export COLOR_04="#d8e30e"           # COMMAND_COLOR2
export COLOR_05="#3449d1"           # PATH
export COLOR_06="#8400ff"           # SYNTAX_VAR
export COLOR_07="#0798ab"           # PROMP
export COLOR_08="#e2d1e3"           #

export COLOR_09="#5a5a5a"           #
export COLOR_10="#f01578"           # COMMAND_ERROR
export COLOR_11="#6ce05c"           # EXEC
export COLOR_12="#f3f79e"           #
export COLOR_13="#97a4f7"           # FOLDER
export COLOR_14="#c495f0"           #
export COLOR_15="#68f2e0"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#0e100a"   # Background Color
export FOREGROUND_COLOR="#f7f7f7"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Kibble"
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
