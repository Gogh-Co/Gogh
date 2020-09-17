#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#191622"           # HOST
export COLOR_02="#E96379"           # SYNTAX_STRING
export COLOR_03="#67e480"           # COMMAND
export COLOR_04="#E89E64"           # COMMAND_COLOR2
export COLOR_05="#78D1E1"           # PATH
export COLOR_06="#988BC7"           # SYNTAX_VAR
export COLOR_07="#FF79C6"           # PROMP
export COLOR_08="#ABB2BF"           #

export COLOR_09="#000000"           #
export COLOR_10="#E96379"           # COMMAND_ERROR
export COLOR_11="#67e480"           # EXEC
export COLOR_12="#E89E64"           #
export COLOR_13="#78D1E1"           # FOLDER
export COLOR_14="#988BC7"           #
export COLOR_15="#FF79C6"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#191622"   # Background Color
export FOREGROUND_COLOR="#ABB2BF"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Omni"
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
