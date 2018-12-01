#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#c13900"           # SYNTAX_STRING
export COLOR_03="#a4a900"           # COMMAND
export COLOR_04="#caaf00"           # COMMAND_COLOR2
export COLOR_05="#bd6d00"           # PATH
export COLOR_06="#fc5e00"           # SYNTAX_VAR
export COLOR_07="#f79500"           # PROMP
export COLOR_08="#ffc88a"           #

export COLOR_09="#6a4f2a"           #
export COLOR_10="#ff8c68"           # COMMAND_ERROR
export COLOR_11="#f6ff40"           # EXEC
export COLOR_12="#ffe36e"           #
export COLOR_13="#ffbe55"           # FOLDER
export COLOR_14="#fc874f"           #
export COLOR_15="#c69752"           #
export COLOR_16="#fafaff"           #

export BACKGROUND_COLOR="#262626"   # Background Color
export FOREGROUND_COLOR="#ffcb83"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="IC Orange PPL"
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
