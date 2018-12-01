#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#383838"           # HOST
export COLOR_02="#a95551"           # SYNTAX_STRING
export COLOR_03="#666666"           # COMMAND
export COLOR_04="#a98051"           # COMMAND_COLOR2
export COLOR_05="#657d3e"           # PATH
export COLOR_06="#767676"           # SYNTAX_VAR
export COLOR_07="#c9c9c9"           # PROMP
export COLOR_08="#d0b8a3"           #

export COLOR_09="#474747"           #
export COLOR_10="#a97775"           # COMMAND_ERROR
export COLOR_11="#8c8c8c"           # EXEC
export COLOR_12="#a99175"           #
export COLOR_13="#98bd5e"           # FOLDER
export COLOR_14="#a3a3a3"           #
export COLOR_15="#dcdcdc"           #
export COLOR_16="#d8c8bb"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#a0a0a0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="N0tch2k"
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
