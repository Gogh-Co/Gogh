#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#302b2a"           # HOST
export COLOR_02="#a7463d"           # SYNTAX_STRING
export COLOR_03="#587744"           # COMMAND
export COLOR_04="#9d602a"           # COMMAND_COLOR2
export COLOR_05="#485b98"           # PATH
export COLOR_06="#864651"           # SYNTAX_VAR
export COLOR_07="#9c814f"           # PROMP
export COLOR_08="#c9c9c9"           #

export COLOR_09="#4d4e48"           #
export COLOR_10="#aa000c"           # COMMAND_ERROR
export COLOR_11="#128c21"           # EXEC
export COLOR_12="#fc6a21"           #
export COLOR_13="#7999f7"           # FOLDER
export COLOR_14="#fd8aa1"           #
export COLOR_15="#fad484"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#1a1818"   # Background Color
export FOREGROUND_COLOR="#c9c9c9"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Sundried"
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
