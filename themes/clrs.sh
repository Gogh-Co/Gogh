#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#f8282a"           # SYNTAX_STRING
export COLOR_03="#328a5d"           # COMMAND
export COLOR_04="#fa701d"           # COMMAND_COLOR2
export COLOR_05="#135cd0"           # PATH
export COLOR_06="#9f00bd"           # SYNTAX_VAR
export COLOR_07="#33c3c1"           # PROMP
export COLOR_08="#b3b3b3"           #

export COLOR_09="#555753"           #
export COLOR_10="#fb0416"           # COMMAND_ERROR
export COLOR_11="#2cc631"           # EXEC
export COLOR_12="#fdd727"           #
export COLOR_13="#1670ff"           # FOLDER
export COLOR_14="#e900b0"           #
export COLOR_15="#3ad5ce"           #
export COLOR_16="#eeeeec"           #

export BACKGROUND_COLOR="#ffffff"   # Background Color
export FOREGROUND_COLOR="#262626"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="CLRS"
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
