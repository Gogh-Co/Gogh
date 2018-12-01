#!/usr/bin/env bash
# This is an adaptation of the "One Half Dark" color scheme published by
# Son A. Pham under the MIT license: https://github.com/sonph/onehalf

# ====================CONFIG THIS =============================== #
export COLOR_01="#282c34"           # HOST
export COLOR_02="#e06c75"           # SYNTAX_STRING
export COLOR_03="#98c379"           # COMMAND
export COLOR_04="#e5c07b"           # COMMAND_COLOR2
export COLOR_05="#61afef"           # PATH
export COLOR_06="#c678dd"           # SYNTAX_VAR
export COLOR_07="#56b6c2"           # PROMP
export COLOR_08="#dcdfe4"           #

export COLOR_09="#282c34"           #
export COLOR_10="#e06c75"           # COMMAND_ERROR
export COLOR_11="#98c379"           # EXEC
export COLOR_12="#e5c07b"           #
export COLOR_13="#61afef"           # FOLDER
export COLOR_14="#c678dd"           #
export COLOR_15="#56b6c2"           #
export COLOR_16="#dcdfe4"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#dcdfe4"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="One Half Black"
# =============================================







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
