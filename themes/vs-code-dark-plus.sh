#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#6A787A"           # HOST
export COLOR_02="#E9653B"           # SYNTAX_STRING
export COLOR_03="#39E9A8"           # COMMAND
export COLOR_04="#E5B684"           # COMMAND_COLOR2
export COLOR_05="#44AAE6"           # PATH
export COLOR_06="#E17599"           # SYNTAX_VAR
export COLOR_07="#3DD5E7"           # PROMP
export COLOR_08="#C3DDE1"           #

export COLOR_09="#598489"           #
export COLOR_10="#E65029"           # COMMAND_ERROR
export COLOR_11="#00FF9A"           # EXEC
export COLOR_12="#E89440"           #
export COLOR_13="#009AFB"           # FOLDER
export COLOR_14="#FF578F"           #
export COLOR_15="#5FFFFF"           #
export COLOR_16="#D9FBFF"           #

export BACKGROUND_COLOR="#1E1E1E"   # Background Color
export FOREGROUND_COLOR="#CCCCCC"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="VS Code Dark+"
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
