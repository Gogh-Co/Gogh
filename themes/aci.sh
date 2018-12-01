#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#363636"           # HOST
export COLOR_02="#ff0883"           # SYNTAX_STRING
export COLOR_03="#83ff08"           # COMMAND
export COLOR_04="#ff8308"           # COMMAND_COLOR2
export COLOR_05="#0883ff"           # PATH
export COLOR_06="#8308ff"           # SYNTAX_VAR
export COLOR_07="#08ff83"           # PROMP
export COLOR_08="#b6b6b6"           #

export COLOR_09="#424242"           #
export COLOR_10="#ff1e8e"           # COMMAND_ERROR
export COLOR_11="#8eff1e"           # EXEC
export COLOR_12="#ff8e1e"           #
export COLOR_13="#1e8eff"           # FOLDER
export COLOR_14="#8e1eff"           #
export COLOR_15="#1eff8e"           #
export COLOR_16="#c2c2c2"           #

export BACKGROUND_COLOR="#0d1926"   # Background Color
export FOREGROUND_COLOR="#b4e1fd"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Aci"
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
