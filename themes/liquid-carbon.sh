#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff3030"           # SYNTAX_STRING
export COLOR_03="#559a70"           # COMMAND
export COLOR_04="#ccac00"           # COMMAND_COLOR2
export COLOR_05="#0099cc"           # PATH
export COLOR_06="#cc69c8"           # SYNTAX_VAR
export COLOR_07="#7ac4cc"           # PROMP
export COLOR_08="#bccccc"           #

export COLOR_09="#000000"           #
export COLOR_10="#ff3030"           # COMMAND_ERROR
export COLOR_11="#559a70"           # EXEC
export COLOR_12="#ccac00"           #
export COLOR_13="#0099cc"           # FOLDER
export COLOR_14="#cc69c8"           #
export COLOR_15="#7ac4cc"           #
export COLOR_16="#bccccc"           #

export BACKGROUND_COLOR="#303030"   # Background Color
export FOREGROUND_COLOR="#afc2c2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Liquid Carbon"
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
