#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#0A0E14"           # HOST
export COLOR_02="#FF3333"           # SYNTAX_STRING
export COLOR_03="#C2D94C"           # COMMAND
export COLOR_04="#FF8F40"           # COMMAND_COLOR2
export COLOR_05="#59C2FF"           # PATH
export COLOR_06="#FFEE99"           # SYNTAX_VAR
export COLOR_07="#95E6CB"           # PROMP
export COLOR_08="#B3B1AD"           #

export COLOR_09="#4D5566"           #
export COLOR_10="#FF3333"           # COMMAND_ERROR
export COLOR_11="#C2D94C"           # EXEC
export COLOR_12="#FF8F40"           #
export COLOR_13="#59C2FF"           # FOLDER
export COLOR_14="#FFEE99"           #
export COLOR_15="#95E6CB"           #
export COLOR_16="#B3B1AD"           #

export BACKGROUND_COLOR="#0A0E14"   # Background Color
export FOREGROUND_COLOR="#B3B1AD"   # Foreground Color (text)
export CURSOR_COLOR="#E6B450" # Cursor color
export PROFILE_NAME="Ayu Dark"
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
