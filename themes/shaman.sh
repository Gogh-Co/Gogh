#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#012026"           # HOST
export COLOR_02="#b2302d"           # SYNTAX_STRING
export COLOR_03="#00a941"           # COMMAND
export COLOR_04="#5e8baa"           # COMMAND_COLOR2
export COLOR_05="#449a86"           # PATH
export COLOR_06="#00599d"           # SYNTAX_VAR
export COLOR_07="#5d7e19"           # PROMP
export COLOR_08="#405555"           #

export COLOR_09="#384451"           #
export COLOR_10="#ff4242"           # COMMAND_ERROR
export COLOR_11="#2aea5e"           # EXEC
export COLOR_12="#8ed4fd"           #
export COLOR_13="#61d5ba"           # FOLDER
export COLOR_14="#1298ff"           #
export COLOR_15="#98d028"           #
export COLOR_16="#58fbd6"           #

export BACKGROUND_COLOR="#001015"   # Background Color
export FOREGROUND_COLOR="#405555"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Shaman"
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
