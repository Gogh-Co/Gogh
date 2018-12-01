#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#d00e18"           # SYNTAX_STRING
export COLOR_03="#138034"           # COMMAND
export COLOR_04="#ffcb3e"           # COMMAND_COLOR2
export COLOR_05="#006bb3"           # PATH
export COLOR_06="#6b2775"           # SYNTAX_VAR
export COLOR_07="#384564"           # PROMP
export COLOR_08="#ededed"           #

export COLOR_09="#5d504a"           #
export COLOR_10="#f07e18"           # COMMAND_ERROR
export COLOR_11="#b1d130"           # EXEC
export COLOR_12="#fff120"           #
export COLOR_13="#4fc2fd"           # FOLDER
export COLOR_14="#de0071"           #
export COLOR_15="#5d504a"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#222225"   # Background Color
export FOREGROUND_COLOR="#ededed"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Highway"
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
