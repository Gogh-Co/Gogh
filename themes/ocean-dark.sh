#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4F4F4F"
export COLOR_02="#AF4B57"
export COLOR_03="#AFD383"
export COLOR_04="#E5C079"
export COLOR_05="#7D90A4"
export COLOR_06="#A4799D"
export COLOR_07="#85A6A5"
export COLOR_08="#EEEDEE"

export COLOR_09="#7B7B7B"
export COLOR_10="#AF4B57"
export COLOR_11="#CEFFAB"
export COLOR_12="#FFFECC"
export COLOR_13="#B5DCFE"
export COLOR_14="#FB9BFE"
export COLOR_15="#DFDFFD"
export COLOR_16="#FEFFFE"

export BACKGROUND_COLOR="#1C1F27"
export FOREGROUND_COLOR="#979CAC"
export CURSOR_COLOR="#979CAC"
export PROFILE_NAME="Ocean Dark"
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
