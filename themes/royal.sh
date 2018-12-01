#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#241f2b"           # HOST
export COLOR_02="#91284c"           # SYNTAX_STRING
export COLOR_03="#23801c"           # COMMAND
export COLOR_04="#b49d27"           # COMMAND_COLOR2
export COLOR_05="#6580b0"           # PATH
export COLOR_06="#674d96"           # SYNTAX_VAR
export COLOR_07="#8aaabe"           # PROMP
export COLOR_08="#524966"           #

export COLOR_09="#312d3d"           #
export COLOR_10="#d5356c"           # COMMAND_ERROR
export COLOR_11="#2cd946"           # EXEC
export COLOR_12="#fde83b"           #
export COLOR_13="#90baf9"           # FOLDER
export COLOR_14="#a479e3"           #
export COLOR_15="#acd4eb"           #
export COLOR_16="#9e8cbd"           #

export BACKGROUND_COLOR="#100815"   # Background Color
export FOREGROUND_COLOR="#514968"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Royal"
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
