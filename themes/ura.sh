#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"          # HOST
export COLOR_02="#c21b6f"          # SYNTAX_STRING
export COLOR_03="#6fc21b"          # COMMAND
export COLOR_04="#c26f1b"          # COMMAND_COLOR2
export COLOR_05="#1b6fc2"          # PATH
export COLOR_06="#6f1bc2"          # SYNTAX_VAR
export COLOR_07="#1bc26f"          # PROMP
export COLOR_08="#808080"          #

export COLOR_09="#808080"          #
export COLOR_10="#ee84b9"          # COMMAND_ERROR
export COLOR_11="#b9ee84"          # EXEC
export COLOR_12="#eeb984"          #
export COLOR_13="#84b9ee"          # FOLDER
export COLOR_14="#b984ee"          #
export COLOR_15="#84eeb9"          #
export COLOR_16="#e5e5e5"          #

export BACKGROUND_COLOR="#feffee"  # Background Color
export FOREGROUND_COLOR="#23476a"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Ura"
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
