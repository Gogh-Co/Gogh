#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#757575"           # HOST
export COLOR_02="#825d4d"           # SYNTAX_STRING
export COLOR_03="#728c62"           # COMMAND
export COLOR_04="#ada16d"           # COMMAND_COLOR2
export COLOR_05="#4d7b82"           # PATH
export COLOR_06="#8a7267"           # SYNTAX_VAR
export COLOR_07="#729494"           # PROMP
export COLOR_08="#e0e0e0"           #

export COLOR_09="#8a8a8a"           #
export COLOR_10="#cf937a"           # COMMAND_ERROR
export COLOR_11="#98d9aa"           # EXEC
export COLOR_12="#fae79d"           #
export COLOR_13="#7ac3cf"           # FOLDER
export COLOR_14="#d6b2a1"           #
export COLOR_15="#ade0e0"           #
export COLOR_16="#e0e0e0"           #

export BACKGROUND_COLOR="#243435"   # Background Color
export FOREGROUND_COLOR="#d4e7d4"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Seafoam Pastel"
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
