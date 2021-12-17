#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3E3838"           # HOST, Black
export COLOR_02="#DF7484"           # SYNTAX_STRING, Red
export COLOR_03="#BBD87E"           # COMMAND, Green
export COLOR_04="#EDCE73"           # COMMAND_COLOR2, Yellow
export COLOR_05="#DC9373"           # PATH, Magenta
export COLOR_06="#A9AAE9"           # SYNTAX_VAR, Blue
export COLOR_07="#A4D7CC"           # PROMP, Cyan
export COLOR_08="#FBF2F3"           # White

export COLOR_09="#70696A"           # Bright Black
export COLOR_10="#DF7484"           # COMMAND_ERROR, Bright Red
export COLOR_11="#BBD87E"           # EXEC, Bright Green
export COLOR_12="#EDCE73"           # Bright Yellow
export COLOR_13="#DC9373"           # FOLDER, Magenta
export COLOR_14="#A9AAE9"           # Bright Bright Blue
export COLOR_15="#A4D7CC"           # Bright Cyan
export COLOR_16="#FBF2F3"           # Bright White

export BACKGROUND_COLOR="#3E3838"   # Background Color
export FOREGROUND_COLOR="#FBF2F3"   # Text

export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Monokai Pro Ristretto"
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
