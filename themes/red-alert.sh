#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#d62e4e"           # SYNTAX_STRING
export COLOR_03="#71be6b"           # COMMAND
export COLOR_04="#beb86b"           # COMMAND_COLOR2
export COLOR_05="#489bee"           # PATH
export COLOR_06="#e979d7"           # SYNTAX_VAR
export COLOR_07="#6bbeb8"           # PROMP
export COLOR_08="#d6d6d6"           #

export COLOR_09="#262626"           #
export COLOR_10="#e02553"           # COMMAND_ERROR
export COLOR_11="#aff08c"           # EXEC
export COLOR_12="#dfddb7"           #
export COLOR_13="#65aaf1"           # FOLDER
export COLOR_14="#ddb7df"           #
export COLOR_15="#b7dfdd"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#762423"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Red Alert"
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
