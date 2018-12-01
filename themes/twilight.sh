#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#141414"           # HOST
export COLOR_02="#c06d44"           # SYNTAX_STRING
export COLOR_03="#afb97a"           # COMMAND
export COLOR_04="#c2a86c"           # COMMAND_COLOR2
export COLOR_05="#44474a"           # PATH
export COLOR_06="#b4be7c"           # SYNTAX_VAR
export COLOR_07="#778385"           # PROMP
export COLOR_08="#ffffd4"           #

export COLOR_09="#262626"           #
export COLOR_10="#de7c4c"           # COMMAND_ERROR
export COLOR_11="#ccd88c"           # EXEC
export COLOR_12="#e2c47e"           #
export COLOR_13="#5a5e62"           # FOLDER
export COLOR_14="#d0dc8e"           #
export COLOR_15="#8a989b"           #
export COLOR_16="#ffffd4"           #

export BACKGROUND_COLOR="#141414"   # Background Color
export FOREGROUND_COLOR="#ffffd4"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Twilight"
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
