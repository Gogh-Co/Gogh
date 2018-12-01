#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#181818"           # HOST
export COLOR_02="#810009"           # SYNTAX_STRING
export COLOR_03="#48513b"           # COMMAND
export COLOR_04="#cc8b3f"           # COMMAND_COLOR2
export COLOR_05="#576d8c"           # PATH
export COLOR_06="#724d7c"           # SYNTAX_VAR
export COLOR_07="#5c4f4b"           # PROMP
export COLOR_08="#aea47f"           #

export COLOR_09="#555555"           #
export COLOR_10="#ac3835"           # COMMAND_ERROR
export COLOR_11="#a6a75d"           # EXEC
export COLOR_12="#dcdf7c"           #
export COLOR_13="#3097c6"           # FOLDER
export COLOR_14="#d33061"           #
export COLOR_15="#f3dbb2"           #
export COLOR_16="#f4f4f4"           #

export BACKGROUND_COLOR="#191c27"   # Background Color
export FOREGROUND_COLOR="#aea47a"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Ciapre"
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
