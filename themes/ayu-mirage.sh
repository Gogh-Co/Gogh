#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1F2430"           # HOST
export COLOR_02="#FF3333"           # SYNTAX_STRING
export COLOR_03="#BAE67E"           # COMMAND
export COLOR_04="#FFA759"           # COMMAND_COLOR2
export COLOR_05="#73D0FF"           # PATH
export COLOR_06="#D4BFFF"           # SYNTAX_VAR
export COLOR_07="#95E6CB"           # PROMP
export COLOR_08="#CBCCC6"           #

export COLOR_09="#707A8C"           #
export COLOR_10="#FF3333"           # COMMAND_ERROR
export COLOR_11="#BAE67E"           # EXEC
export COLOR_12="#FFA759"           #
export COLOR_13="#73D0FF"           # FOLDER
export COLOR_14="#D4BFFF"           #
export COLOR_15="#95E6CB"           #
export COLOR_16="#CBCCC6"           #

export BACKGROUND_COLOR="#1F2430"   # Background Color
export FOREGROUND_COLOR="#CBCCC6"   # Foreground Color (text)
export CURSOR_COLOR="#FFCC66" # Cursor color
export PROFILE_NAME="Ayu Mirage"
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
