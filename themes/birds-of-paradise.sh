#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#573d26"           # HOST
export COLOR_02="#be2d26"           # SYNTAX_STRING
export COLOR_03="#6ba18a"           # COMMAND
export COLOR_04="#e99d2a"           # COMMAND_COLOR2
export COLOR_05="#5a86ad"           # PATH
export COLOR_06="#ac80a6"           # SYNTAX_VAR
export COLOR_07="#74a6ad"           # PROMP
export COLOR_08="#e0dbb7"           #

export COLOR_09="#9b6c4a"           #
export COLOR_10="#e84627"           # COMMAND_ERROR
export COLOR_11="#95d8ba"           # EXEC
export COLOR_12="#d0d150"           #
export COLOR_13="#b8d3ed"           # FOLDER
export COLOR_14="#d19ecb"           #
export COLOR_15="#93cfd7"           #
export COLOR_16="#fff9d5"           #

export BACKGROUND_COLOR="#2a1f1d"   # Background Color
export FOREGROUND_COLOR="#e0dbb7"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Birds Of Paradise"
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
