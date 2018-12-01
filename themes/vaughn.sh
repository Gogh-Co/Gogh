#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#25234f"           # HOST
export COLOR_02="#705050"           # SYNTAX_STRING
export COLOR_03="#60b48a"           # COMMAND
export COLOR_04="#dfaf8f"           # COMMAND_COLOR2
export COLOR_05="#5555ff"           # PATH
export COLOR_06="#f08cc3"           # SYNTAX_VAR
export COLOR_07="#8cd0d3"           # PROMP
export COLOR_08="#709080"           #

export COLOR_09="#709080"           #
export COLOR_10="#dca3a3"           # COMMAND_ERROR
export COLOR_11="#60b48a"           # EXEC
export COLOR_12="#f0dfaf"           #
export COLOR_13="#5555ff"           # FOLDER
export COLOR_14="#ec93d3"           #
export COLOR_15="#93e0e3"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#25234f"   # Background Color
export FOREGROUND_COLOR="#dcdccc"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Vaughn"
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
