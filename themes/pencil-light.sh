#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#212121"           # HOST
export COLOR_02="#c30771"           # SYNTAX_STRING
export COLOR_03="#10a778"           # COMMAND
export COLOR_04="#a89c14"           # COMMAND_COLOR2
export COLOR_05="#008ec4"           # PATH
export COLOR_06="#523c79"           # SYNTAX_VAR
export COLOR_07="#20a5ba"           # PROMP
export COLOR_08="#d9d9d9"           #

export COLOR_09="#424242"           #
export COLOR_10="#fb007a"           # COMMAND_ERROR
export COLOR_11="#5fd7af"           # EXEC
export COLOR_12="#f3e430"           #
export COLOR_13="#20bbfc"           # FOLDER
export COLOR_14="#6855de"           #
export COLOR_15="#4fb8cc"           #
export COLOR_16="#f1f1f1"           #

export BACKGROUND_COLOR="#f1f1f1"   # Background Color
export FOREGROUND_COLOR="#424242"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Pencil Light"
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
