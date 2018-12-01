#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#b87a7a"           # SYNTAX_STRING
export COLOR_03="#7ab87a"           # COMMAND
export COLOR_04="#b8b87a"           # COMMAND_COLOR2
export COLOR_05="#7a7ab8"           # PATH
export COLOR_06="#b87ab8"           # SYNTAX_VAR
export COLOR_07="#7ab8b8"           # PROMP
export COLOR_08="#d9d9d9"           #

export COLOR_09="#262626"           #
export COLOR_10="#dbbdbd"           # COMMAND_ERROR
export COLOR_11="#bddbbd"           # EXEC
export COLOR_12="#dbdbbd"           #
export COLOR_13="#bdbddb"           # FOLDER
export COLOR_14="#dbbddb"           #
export COLOR_15="#bddbdb"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#0d1926"   # Background Color
export FOREGROUND_COLOR="#d9e6f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Miu"
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
