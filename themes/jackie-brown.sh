#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2c1d16"           # HOST
export COLOR_02="#ef5734"           # SYNTAX_STRING
export COLOR_03="#2baf2b"           # COMMAND
export COLOR_04="#bebf00"           # COMMAND_COLOR2
export COLOR_05="#246eb2"           # PATH
export COLOR_06="#d05ec1"           # SYNTAX_VAR
export COLOR_07="#00acee"           # PROMP
export COLOR_08="#bfbfbf"           #

export COLOR_09="#666666"           #
export COLOR_10="#e50000"           # COMMAND_ERROR
export COLOR_11="#86a93e"           # EXEC
export COLOR_12="#e5e500"           #
export COLOR_13="#0000ff"           # FOLDER
export COLOR_14="#e500e5"           #
export COLOR_15="#00e5e5"           #
export COLOR_16="#e5e5e5"           #

export BACKGROUND_COLOR="#2c1d16"   # Background Color
export FOREGROUND_COLOR="#ffcc2f"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Jackie Brown"
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
