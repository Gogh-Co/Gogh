#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#777777"
export COLOR_02="#FF0055"
export COLOR_03="#739100"
export COLOR_04="#503D15"
export COLOR_05="#538091"
export COLOR_06="#5B345E"
export COLOR_07="#538091"
export COLOR_08="#999999"

export COLOR_09="#999999"
export COLOR_10="#D65E76"
export COLOR_11="#9CC700"
export COLOR_12="#947555"
export COLOR_13="#9DB3CD"
export COLOR_14="#A184A4"
export COLOR_15="#85B2AA"
export COLOR_16="#BABABA"

export BACKGROUND_COLOR="#EFEFEF"
export FOREGROUND_COLOR="#444444"
export CURSOR_COLOR="#FF0054"
export PROFILE_NAME="Hemisu Light"
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
