#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#cc5555"           # SYNTAX_STRING
export COLOR_03="#55cc55"           # COMMAND
export COLOR_04="#cdcd55"           # COMMAND_COLOR2
export COLOR_05="#5555cc"           # PATH
export COLOR_06="#cc55cc"           # SYNTAX_VAR
export COLOR_07="#7acaca"           # PROMP
export COLOR_08="#cccccc"           #

export COLOR_09="#555555"           #
export COLOR_10="#ff5555"           # COMMAND_ERROR
export COLOR_11="#55ff55"           # EXEC
export COLOR_12="#ffff55"           #
export COLOR_13="#5555ff"           # FOLDER
export COLOR_14="#ff55ff"           #
export COLOR_15="#55ffff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#b3b3b3"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Wez"
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
