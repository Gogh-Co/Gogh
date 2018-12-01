#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff3f00"           # SYNTAX_STRING
export COLOR_03="#00bb00"           # COMMAND
export COLOR_04="#e7b000"           # COMMAND_COLOR2
export COLOR_05="#0072ff"           # PATH
export COLOR_06="#bb00bb"           # SYNTAX_VAR
export COLOR_07="#00bbbb"           # PROMP
export COLOR_08="#bbbbbb"           #

export COLOR_09="#555555"           #
export COLOR_10="#bb0000"           # COMMAND_ERROR
export COLOR_11="#00bb00"           # EXEC
export COLOR_12="#e7b000"           #
export COLOR_13="#0072ae"           # FOLDER
export COLOR_14="#ff55ff"           #
export COLOR_15="#55ffff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#7a251e"   # Background Color
export FOREGROUND_COLOR="#d7c9a7"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Red Sands"
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
