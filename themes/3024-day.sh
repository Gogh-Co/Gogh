#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#090300"           # HOST
export COLOR_02="#db2d20"           # SYNTAX_STRING
export COLOR_03="#01a252"           # COMMAND
export COLOR_04="#fded02"           # COMMAND_COLOR2
export COLOR_05="#01a0e4"           # PATH
export COLOR_06="#a16a94"           # SYNTAX_VAR
export COLOR_07="#b5e4f4"           # PROMP
export COLOR_08="#a5a2a2"           #

export COLOR_09="#5c5855"           #
export COLOR_10="#e8bbd0"           # COMMAND_ERROR
export COLOR_11="#3a3432"           # EXEC
export COLOR_12="#4a4543"           #
export COLOR_13="#807d7c"           # FOLDER
export COLOR_14="#d6d5d4"           #
export COLOR_15="#cdab53"           #
export COLOR_16="#f7f7f7"           #

export BACKGROUND_COLOR="#f7f7f7"   # Background Color
export FOREGROUND_COLOR="#4a4543"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="3024 Day"
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
