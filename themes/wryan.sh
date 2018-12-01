#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#333333"           # HOST
export COLOR_02="#8c4665"           # SYNTAX_STRING
export COLOR_03="#287373"           # COMMAND
export COLOR_04="#7c7c99"           # COMMAND_COLOR2
export COLOR_05="#395573"           # PATH
export COLOR_06="#5e468c"           # SYNTAX_VAR
export COLOR_07="#31658c"           # PROMP
export COLOR_08="#899ca1"           #

export COLOR_09="#3d3d3d"           #
export COLOR_10="#bf4d80"           # COMMAND_ERROR
export COLOR_11="#53a6a6"           # EXEC
export COLOR_12="#9e9ecb"           #
export COLOR_13="#477ab3"           # FOLDER
export COLOR_14="#7e62b3"           #
export COLOR_15="#6096bf"           #
export COLOR_16="#c0c0c0"           #

export BACKGROUND_COLOR="#101010"   # Background Color
export FOREGROUND_COLOR="#999993"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Wryan"
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
