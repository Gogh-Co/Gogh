#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#575757"           # HOST
export COLOR_02="#ff1b00"           # SYNTAX_STRING
export COLOR_03="#a5e055"           # COMMAND
export COLOR_04="#fbe74a"           # COMMAND_COLOR2
export COLOR_05="#496487"           # PATH
export COLOR_06="#fd5ff1"           # SYNTAX_VAR
export COLOR_07="#86e9fe"           # PROMP
export COLOR_08="#cbcccb"           #

export COLOR_09="#262626"           #
export COLOR_10="#d51d00"           # COMMAND_ERROR
export COLOR_11="#a5df55"           # EXEC
export COLOR_12="#fbe84a"           #
export COLOR_13="#89beff"           # FOLDER
export COLOR_14="#c001c1"           #
export COLOR_15="#86eafe"           #
export COLOR_16="#dbdbdb"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#dbdbdb"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Hurtado"
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
