#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#323232"           # HOST
export COLOR_02="#c22832"           # SYNTAX_STRING
export COLOR_03="#8ec43d"           # COMMAND
export COLOR_04="#e0c64f"           # COMMAND_COLOR2
export COLOR_05="#43a5d5"           # PATH
export COLOR_06="#8b57b5"           # SYNTAX_VAR
export COLOR_07="#8ec43d"           # PROMP
export COLOR_08="#eeeeee"           #

export COLOR_09="#323232"           #
export COLOR_10="#c22832"           # COMMAND_ERROR
export COLOR_11="#8ec43d"           # EXEC
export COLOR_12="#e0c64f"           #
export COLOR_13="#43a5d5"           # FOLDER
export COLOR_14="#8b57b5"           #
export COLOR_15="#8ec43d"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#111213"   # Background Color
export FOREGROUND_COLOR="#cacecd"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Seti"
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
