#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#351b0e"           # HOST
export COLOR_02="#9b291c"           # SYNTAX_STRING
export COLOR_03="#636232"           # COMMAND
export COLOR_04="#c36e28"           # COMMAND_COLOR2
export COLOR_05="#515c5d"           # PATH
export COLOR_06="#9b1d29"           # SYNTAX_VAR
export COLOR_07="#588056"           # PROMP
export COLOR_08="#f7d75c"           #

export COLOR_09="#874228"           #
export COLOR_10="#ff4331"           # COMMAND_ERROR
export COLOR_11="#b4b264"           # EXEC
export COLOR_12="#ff9566"           #
export COLOR_13="#9eb2b4"           # FOLDER
export COLOR_14="#ff5b6a"           #
export COLOR_15="#8acd8f"           #
export COLOR_16="#ffe598"           #

export BACKGROUND_COLOR="#120b0d"   # Background Color
export FOREGROUND_COLOR="#f7d66a"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Mona Lisa"
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
