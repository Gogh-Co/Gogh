#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000507"           # HOST
export COLOR_02="#d94085"           # SYNTAX_STRING
export COLOR_03="#2ab250"           # COMMAND
export COLOR_04="#ffd16f"           # COMMAND_COLOR2
export COLOR_05="#883cdc"           # PATH
export COLOR_06="#ececec"           # SYNTAX_VAR
export COLOR_07="#c1b8b7"           # PROMP
export COLOR_08="#fff8de"           #

export COLOR_09="#009cc9"           #
export COLOR_10="#da6bac"           # COMMAND_ERROR
export COLOR_11="#f4dca5"           # EXEC
export COLOR_12="#eac066"           #
export COLOR_13="#308cba"           # FOLDER
export COLOR_14="#ae636b"           #
export COLOR_15="#ff919d"           #
export COLOR_16="#e4838d"           #

export BACKGROUND_COLOR="#1f1726"   # Background Color
export FOREGROUND_COLOR="#dafaff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Wild Cherry"
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
