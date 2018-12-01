#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4d4d4d"           # HOST
export COLOR_02="#705050"           # SYNTAX_STRING
export COLOR_03="#60b48a"           # COMMAND
export COLOR_04="#f0dfaf"           # COMMAND_COLOR2
export COLOR_05="#506070"           # PATH
export COLOR_06="#dc8cc3"           # SYNTAX_VAR
export COLOR_07="#8cd0d3"           # PROMP
export COLOR_08="#dcdccc"           #

export COLOR_09="#709080"           #
export COLOR_10="#dca3a3"           # COMMAND_ERROR
export COLOR_11="#c3bf9f"           # EXEC
export COLOR_12="#e0cf9f"           #
export COLOR_13="#94bff3"           # FOLDER
export COLOR_14="#ec93d3"           #
export COLOR_15="#93e0e3"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#3f3f3f"   # Background Color
export FOREGROUND_COLOR="#dcdccc"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Zenburn"
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
