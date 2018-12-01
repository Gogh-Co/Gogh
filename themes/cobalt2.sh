#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff0000"           # SYNTAX_STRING
export COLOR_03="#38de21"           # COMMAND
export COLOR_04="#ffe50a"           # COMMAND_COLOR2
export COLOR_05="#1460d2"           # PATH
export COLOR_06="#ff005d"           # SYNTAX_VAR
export COLOR_07="#00bbbb"           # PROMP
export COLOR_08="#bbbbbb"           #

export COLOR_09="#555555"           #
export COLOR_10="#f40e17"           # COMMAND_ERROR
export COLOR_11="#3bd01d"           # EXEC
export COLOR_12="#edc809"           #
export COLOR_13="#5555ff"           # FOLDER
export COLOR_14="#ff55ff"           #
export COLOR_15="#6ae3fa"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#132738"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Cobalt 2"
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
