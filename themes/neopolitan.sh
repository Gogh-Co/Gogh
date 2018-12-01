#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#800000"           # SYNTAX_STRING
export COLOR_03="#61ce3c"           # COMMAND
export COLOR_04="#fbde2d"           # COMMAND_COLOR2
export COLOR_05="#253b76"           # PATH
export COLOR_06="#ff0080"           # SYNTAX_VAR
export COLOR_07="#8da6ce"           # PROMP
export COLOR_08="#f8f8f8"           #

export COLOR_09="#000000"           #
export COLOR_10="#800000"           # COMMAND_ERROR
export COLOR_11="#61ce3c"           # EXEC
export COLOR_12="#fbde2d"           #
export COLOR_13="#253b76"           # FOLDER
export COLOR_14="#ff0080"           #
export COLOR_15="#8da6ce"           #
export COLOR_16="#f8f8f8"           #

export BACKGROUND_COLOR="#271f19"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Neopolitan"
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
