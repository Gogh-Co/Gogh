#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1b1d1e"           # HOST
export COLOR_02="#7325FA"           # SYNTAX_STRING
export COLOR_03="#23E298"           # COMMAND
export COLOR_04="#60D4DF"           # COMMAND_COLOR2
export COLOR_05="#D08010"           # PATH
export COLOR_06="#FF0087"           # SYNTAX_VAR
export COLOR_07="#D0A843"           # PROMP
export COLOR_08="#BBBBBB"           #

export COLOR_09="#555555"           #
export COLOR_10="#9D66F6"           # COMMAND_ERROR
export COLOR_11="#5FE0B1"           # EXEC
export COLOR_12="#6DF2FF"           #
export COLOR_13="#FFAF00"           # FOLDER
export COLOR_14="#FF87AF"           #
export COLOR_15="#FFCE51"           #
export COLOR_16="#FFFFFF"           #

export BACKGROUND_COLOR="#1b1d1e"   # Background Color
export FOREGROUND_COLOR="#BBBBBB"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Molokai"
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
