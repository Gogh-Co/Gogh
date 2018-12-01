#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#b04b57"           # SYNTAX_STRING
export COLOR_03="#87b379"           # COMMAND
export COLOR_04="#e5c179"           # COMMAND_COLOR2
export COLOR_05="#7d8fa4"           # PATH
export COLOR_06="#a47996"           # SYNTAX_VAR
export COLOR_07="#85a7a5"           # PROMP
export COLOR_08="#b3b8c3"           #

export COLOR_09="#000000"           #
export COLOR_10="#b04b57"           # COMMAND_ERROR
export COLOR_11="#87b379"           # EXEC
export COLOR_12="#e5c179"           #
export COLOR_13="#7d8fa4"           # FOLDER
export COLOR_14="#a47996"           #
export COLOR_15="#85a7a5"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#20242d"   # Background Color
export FOREGROUND_COLOR="#b3b8c3"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="SpaceGray"
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
