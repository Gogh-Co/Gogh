#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#142631"           # HOST
export COLOR_02="#ff2320"           # SYNTAX_STRING
export COLOR_03="#3ba5ff"           # COMMAND
export COLOR_04="#e9e75c"           # COMMAND_COLOR2
export COLOR_05="#8ff586"           # PATH
export COLOR_06="#781aa0"           # SYNTAX_VAR
export COLOR_07="#8ff586"           # PROMP
export COLOR_08="#ba46b2"           #

export COLOR_09="#fff688"           #
export COLOR_10="#d4312e"           # COMMAND_ERROR
export COLOR_11="#8ff586"           # EXEC
export COLOR_12="#e9f06d"           #
export COLOR_13="#3c7dd2"           # FOLDER
export COLOR_14="#8230a7"           #
export COLOR_15="#6cbc67"           #
export COLOR_16="#8ff586"           #

export BACKGROUND_COLOR="#142838"   # Background Color
export FOREGROUND_COLOR="#8ff586"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Cobalt Neon"
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
