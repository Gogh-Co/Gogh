#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2f1e2e"           # HOST
export COLOR_02="#ef6155"           # SYNTAX_STRING
export COLOR_03="#48b685"           # COMMAND
export COLOR_04="#fec418"           # COMMAND_COLOR2
export COLOR_05="#06b6ef"           # PATH
export COLOR_06="#815ba4"           # SYNTAX_VAR
export COLOR_07="#5bc4bf"           # PROMP
export COLOR_08="#a39e9b"           #

export COLOR_09="#776e71"           #
export COLOR_10="#ef6155"           # COMMAND_ERROR
export COLOR_11="#48b685"           # EXEC
export COLOR_12="#fec418"           #
export COLOR_13="#06b6ef"           # FOLDER
export COLOR_14="#815ba4"           #
export COLOR_15="#5bc4bf"           #
export COLOR_16="#e7e9db"           #

export BACKGROUND_COLOR="#2f1e2e"   # Background Color
export FOREGROUND_COLOR="#a39e9b"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Paraiso Dark"
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
