#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"          # HOST
export COLOR_02="#8d534e"          # SYNTAX_STRING
export COLOR_03="#4e8d53"          # COMMAND
export COLOR_04="#888d4e"          # COMMAND_COLOR2
export COLOR_05="#534e8d"          # PATH
export COLOR_06="#8d4e88"          # SYNTAX_VAR
export COLOR_07="#4e888d"          # PROMP
export COLOR_08="#ffffff"          #

export COLOR_09="#000000"          #
export COLOR_10="#b57d78"          # COMMAND_ERROR
export COLOR_11="#78b57d"          # EXEC
export COLOR_12="#b0b578"          #
export COLOR_13="#7d78b5"          # FOLDER
export COLOR_14="#b578b0"          #
export COLOR_15="#78b0b5"          #
export COLOR_16="#ffffff"          #

export BACKGROUND_COLOR="#2e2e35"  # Background Color
export FOREGROUND_COLOR="#ffffff"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Tin"
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
