#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3B4252" #nord1
export COLOR_02="#BF616A" #nord11
export COLOR_03="#A3BE8C" #nord14
export COLOR_04="#EBCB8B" #nord13
export COLOR_05="#81A1C1" #nord9
export COLOR_06="#B48EAD" #nord15
export COLOR_07="#88C0D0" #nord8
export COLOR_08="#E5E9F0" #nord5

export COLOR_09="#4C566A" #nord3
export COLOR_10="#BF616A" #nord11
export COLOR_11="#A3BE8C" #nord14
export COLOR_12="#EBCB8B" #nord13
export COLOR_13="#81A1C1" #nord9
export COLOR_14="#B48EAD" #nord15
export COLOR_15="#8FBCBB" #nord7
export COLOR_16="#ECEFF4" #nord6

export BACKGROUND_COLOR="#2E3440" #nord0
export FOREGROUND_COLOR="#D8DEE9" #nord4
export CURSOR_COLOR=$FOREGROUND_COLOR
export PROFILE_NAME="Nord"
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
