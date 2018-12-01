#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#444444"
export COLOR_02="#FF0054"
export COLOR_03="#B1D630"
export COLOR_04="#9D895E"
export COLOR_05="#67BEE3"
export COLOR_06="#B576BC"
export COLOR_07="#569A9F"
export COLOR_08="#EDEDED"

export COLOR_09="#777777"
export COLOR_10="#D65E75"
export COLOR_11="#BAFFAA"
export COLOR_12="#ECE1C8"
export COLOR_13="#9FD3E5"
export COLOR_14="#DEB3DF"
export COLOR_15="#B6E0E5"
export COLOR_16="#FFFFFF"

export BACKGROUND_COLOR="#000000"
export FOREGROUND_COLOR="#FFFFFF"
export CURSOR_COLOR="#BAFFAA"
export PROFILE_NAME="Hemisu Dark"
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
