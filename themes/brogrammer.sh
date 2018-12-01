#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1f1f1f"           # HOST
export COLOR_02="#f81118"           # SYNTAX_STRING
export COLOR_03="#2dc55e"           # COMMAND
export COLOR_04="#ecba0f"           # COMMAND_COLOR2
export COLOR_05="#2a84d2"           # PATH
export COLOR_06="#4e5ab7"           # SYNTAX_VAR
export COLOR_07="#1081d6"           # PROMP
export COLOR_08="#d6dbe5"           #

export COLOR_09="#d6dbe5"           #
export COLOR_10="#de352e"           # COMMAND_ERROR
export COLOR_11="#1dd361"           # EXEC
export COLOR_12="#f3bd09"           #
export COLOR_13="#1081d6"           # FOLDER
export COLOR_14="#5350b9"           #
export COLOR_15="#0f7ddb"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#131313"   # Background Color
export FOREGROUND_COLOR="#d6dbe5"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Brogrammer"
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
