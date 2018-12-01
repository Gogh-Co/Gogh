#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"          # HOST
export COLOR_02="#C75646"          # SYNTAX_STRING
export COLOR_03="#8EB33B"          # COMMAND
export COLOR_04="#D0B03C"          # COMMAND_COLOR2
export COLOR_05="#72B3CC"          # PATH
export COLOR_06="#C8A0D1"          # SYNTAX_VAR
export COLOR_07="#218693"          # PROMP
export COLOR_08="#B0B0B0"          #

export COLOR_09="#5D5D5D"          #
export COLOR_10="#E09690"          # COMMAND_ERROR
export COLOR_11="#CDEE69"          # EXEC
export COLOR_12="#FFE377"          #
export COLOR_13="#9CD9F0"          # FOLDER
export COLOR_14="#FBB1F9"          #
export COLOR_15="#77DFD8"          #
export COLOR_16="#F7F7F7"          #

export BACKGROUND_COLOR="#242424"  # Background Color
export FOREGROUND_COLOR="#F7F7F7"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Smyck"
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
