#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ac6d74"           # SYNTAX_STRING
export COLOR_03="#74ac6d"           # COMMAND
export COLOR_04="#aca46d"           # COMMAND_COLOR2
export COLOR_05="#6d74ac"           # PATH
export COLOR_06="#a46dac"           # SYNTAX_VAR
export COLOR_07="#6daca4"           # PROMP
export COLOR_08="#e6e6e6"           #

export COLOR_09="#262626"           #
export COLOR_10="#d6b8bc"           # COMMAND_ERROR
export COLOR_11="#bcd6b8"           # EXEC
export COLOR_12="#d6d3b8"           #
export COLOR_13="#b8bcd6"           # FOLDER
export COLOR_14="#d3b8d6"           #
export COLOR_15="#b8d6d3"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#09111a"   # Background Color
export FOREGROUND_COLOR="#d9e6f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Azu"
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
