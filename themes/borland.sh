#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4f4f4f"           # HOST
export COLOR_02="#ff6c60"           # SYNTAX_STRING
export COLOR_03="#a8ff60"           # COMMAND
export COLOR_04="#ffffb6"           # COMMAND_COLOR2
export COLOR_05="#96cbfe"           # PATH
export COLOR_06="#ff73fd"           # SYNTAX_VAR
export COLOR_07="#c6c5fe"           # PROMP
export COLOR_08="#eeeeee"           #

export COLOR_09="#7c7c7c"           #
export COLOR_10="#ffb6b0"           # COMMAND_ERROR
export COLOR_11="#ceffac"           # EXEC
export COLOR_12="#ffffcc"           #
export COLOR_13="#b5dcff"           # FOLDER
export COLOR_14="#ff9cfe"           #
export COLOR_15="#dfdffe"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#0000a4"   # Background Color
export FOREGROUND_COLOR="#ffff4e"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Borland"
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
