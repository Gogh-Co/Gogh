#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4c4c4c"           # HOST
export COLOR_02="#bb0000"           # SYNTAX_STRING
export COLOR_03="#5fde8f"           # COMMAND
export COLOR_04="#f3f167"           # COMMAND_COLOR2
export COLOR_05="#276bd8"           # PATH
export COLOR_06="#bb00bb"           # SYNTAX_VAR
export COLOR_07="#00dadf"           # PROMP
export COLOR_08="#bbbbbb"           #

export COLOR_09="#555555"           #
export COLOR_10="#ff5555"           # COMMAND_ERROR
export COLOR_11="#55ff55"           # EXEC
export COLOR_12="#ffff55"           #
export COLOR_13="#5555ff"           # FOLDER
export COLOR_14="#ff55ff"           #
export COLOR_15="#55ffff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#bbbbbb"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Nightlion V1"
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
