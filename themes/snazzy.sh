#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282A36"
export COLOR_02="#FF5C57"
export COLOR_03="#5AF78E"
export COLOR_04="#F3F99D"
export COLOR_05="#57C7FF"
export COLOR_06="#FF6AC1"
export COLOR_07="#9AEDFE"
export COLOR_08="#F1F1F0"

export COLOR_09="#686868"
export COLOR_10="$COLOR_02"
export COLOR_11="$COLOR_03"
export COLOR_12="$COLOR_04"
export COLOR_13="$COLOR_05"
export COLOR_14="$COLOR_06"
export COLOR_15="$COLOR_07"
export COLOR_16="#EFF0EB"

export BACKGROUND_COLOR="$COLOR_01"
export FOREGROUND_COLOR="$COLOR_16"
export CURSOR_COLOR="#97979B"
export PROFILE_NAME="Snazzy"
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
