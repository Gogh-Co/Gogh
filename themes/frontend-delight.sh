#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#242526"           # HOST
export COLOR_02="#f8511b"           # SYNTAX_STRING
export COLOR_03="#565747"           # COMMAND
export COLOR_04="#fa771d"           # COMMAND_COLOR2
export COLOR_05="#2c70b7"           # PATH
export COLOR_06="#f02e4f"           # SYNTAX_VAR
export COLOR_07="#3ca1a6"           # PROMP
export COLOR_08="#adadad"           #

export COLOR_09="#5fac6d"           #
export COLOR_10="#f74319"           # COMMAND_ERROR
export COLOR_11="#74ec4c"           # EXEC
export COLOR_12="#fdc325"           #
export COLOR_13="#3393ca"           # FOLDER
export COLOR_14="#e75e4f"           #
export COLOR_15="#4fbce6"           #
export COLOR_16="#8c735b"           #

export BACKGROUND_COLOR="#1b1c1d"   # Background Color
export FOREGROUND_COLOR="#adadad"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Frontend Delight"
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
