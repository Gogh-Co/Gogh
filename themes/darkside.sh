#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#e8341c"           # SYNTAX_STRING
export COLOR_03="#68c256"           # COMMAND
export COLOR_04="#f2d42c"           # COMMAND_COLOR2
export COLOR_05="#1c98e8"           # PATH
export COLOR_06="#8e69c9"           # SYNTAX_VAR
export COLOR_07="#1c98e8"           # PROMP
export COLOR_08="#bababa"           #

export COLOR_09="#000000"           #
export COLOR_10="#e05a4f"           # COMMAND_ERROR
export COLOR_11="#77b869"           # EXEC
export COLOR_12="#efd64b"           #
export COLOR_13="#387cd3"           # FOLDER
export COLOR_14="#957bbe"           #
export COLOR_15="#3d97e2"           #
export COLOR_16="#bababa"           #

export BACKGROUND_COLOR="#222324"   # Background Color
export FOREGROUND_COLOR="#bababa"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Darkside"
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
