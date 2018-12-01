#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#da4939"           # SYNTAX_STRING
export COLOR_03="#519f50"           # COMMAND
export COLOR_04="#ffd24a"           # COMMAND_COLOR2
export COLOR_05="#6d9cbe"           # PATH
export COLOR_06="#d0d0ff"           # SYNTAX_VAR
export COLOR_07="#6e9cbe"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#323232"           #
export COLOR_10="#ff7b6b"           # COMMAND_ERROR
export COLOR_11="#83d182"           # EXEC
export COLOR_12="#ffff7c"           #
export COLOR_13="#9fcef0"           # FOLDER
export COLOR_14="#ffffff"           #
export COLOR_15="#a0cef0"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#2b2b2b"   # Background Color
export FOREGROUND_COLOR="#e6e1dc"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Broadcast"
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
