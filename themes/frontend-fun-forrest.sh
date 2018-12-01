#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#d6262b"           # SYNTAX_STRING
export COLOR_03="#919c00"           # COMMAND
export COLOR_04="#be8a13"           # COMMAND_COLOR2
export COLOR_05="#4699a3"           # PATH
export COLOR_06="#8d4331"           # SYNTAX_VAR
export COLOR_07="#da8213"           # PROMP
export COLOR_08="#ddc265"           #

export COLOR_09="#7f6a55"           #
export COLOR_10="#e55a1c"           # COMMAND_ERROR
export COLOR_11="#bfc65a"           # EXEC
export COLOR_12="#ffcb1b"           #
export COLOR_13="#7cc9cf"           # FOLDER
export COLOR_14="#d26349"           #
export COLOR_15="#e6a96b"           #
export COLOR_16="#ffeaa3"           #

export BACKGROUND_COLOR="#251200"   # Background Color
export FOREGROUND_COLOR="#dec165"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Frontend Fun Forrest"
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
