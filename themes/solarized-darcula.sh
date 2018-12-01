#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#25292a"           # HOST
export COLOR_02="#f24840"           # SYNTAX_STRING
export COLOR_03="#629655"           # COMMAND
export COLOR_04="#b68800"           # COMMAND_COLOR2
export COLOR_05="#2075c7"           # PATH
export COLOR_06="#797fd4"           # SYNTAX_VAR
export COLOR_07="#15968d"           # PROMP
export COLOR_08="#d2d8d9"           #

export COLOR_09="#25292a"           #
export COLOR_10="#f24840"           # COMMAND_ERROR
export COLOR_11="#629655"           # EXEC
export COLOR_12="#b68800"           #
export COLOR_13="#2075c7"           # FOLDER
export COLOR_14="#797fd4"           #
export COLOR_15="#15968d"           #
export COLOR_16="#d2d8d9"           #

export BACKGROUND_COLOR="#3d3f41"   # Background Color
export FOREGROUND_COLOR="#d2d8d9"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Solarized Darcula"
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
