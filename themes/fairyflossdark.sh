#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#42395D"           
export COLOR_02="#A8757B"           
export COLOR_03="#FF857F"           
export COLOR_04="#E6C000"           
export COLOR_05="#AE81FF"           
export COLOR_06="#716799"           
export COLOR_07="#C2FFDF"           
export COLOR_08="#F8F8F2"           

export COLOR_09="#75507B"           
export COLOR_10="#FFB8D1"           
export COLOR_11="#F1568E"           
export COLOR_12="#D5A425"           
export COLOR_13="#C5A3FF"           
export COLOR_14="#8077A8"           
export COLOR_15="#C2FFFF"           
export COLOR_16="#F8F8F0"           

export BACKGROUND_COLOR="#42395D"   
export FOREGROUND_COLOR="#C2FFDF"   
export CURSOR_COLOR="#FFB8D1" 
export PROFILE_NAME="Fairy Floss Dark"
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
