#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#303030"          # HOST
export COLOR_02="#a87139"          # SYNTAX_STRING
export COLOR_03="#39a871"          # COMMAND
export COLOR_04="#71a839"          # COMMAND_COLOR2
export COLOR_05="#7139a8"          # PATH
export COLOR_06="#a83971"          # SYNTAX_VAR
export COLOR_07="#3971a8"          # PROMP
export COLOR_08="#8a8a8a"          #

export COLOR_09="#494949"          #
export COLOR_10="#b0763b"          # COMMAND_ERROR
export COLOR_11="#3bb076"          # EXEC
export COLOR_12="#76b03b"          #
export COLOR_13="#763bb0"          # FOLDER
export COLOR_14="#b03b76"          #
export COLOR_15="#3b76b0"          #
export COLOR_16="#cfcfcf"          #

export BACKGROUND_COLOR="#191f1d"  # Background Color
export FOREGROUND_COLOR="#d9e6f2"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Vag"
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
