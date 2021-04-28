#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2C2C2C"           # HOST
export COLOR_02="#CC231C"           # SYNTAX_STRING
export COLOR_03="#689D69"           # COMMAND
export COLOR_04="#D79922"           # COMMAND_COLOR2
export COLOR_05="#366B71"           # PATH
export COLOR_06="#4E5165"           # SYNTAX_VAR
export COLOR_07="#458587"           # PROMP
export COLOR_08="#C8BB97"           #

export COLOR_09="#777777"           #
export COLOR_10="#CC231C"           # COMMAND_ERROR
export COLOR_11="#689D69"           # EXEC
export COLOR_12="#D79922"           #
export COLOR_13="#366B71"           # FOLDER
export COLOR_14="#4E5165"           #
export COLOR_15="#458587"           #
export COLOR_16="#C8BB97"           #

export BACKGROUND_COLOR="#2C2C2C"   # Background Color
export FOREGROUND_COLOR="#DEDEDE"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Chameleon"
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
