#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#DA3E39"
export COLOR_03="#41933E"
export COLOR_04="#855504"
export COLOR_05="#315EEE"
export COLOR_06="#930092"
export COLOR_07="#0E6FAD"
export COLOR_08="#8E8F96"

export COLOR_09="#2A2B32"
export COLOR_10="#DA3E39"
export COLOR_11="#41933E"
export COLOR_12="#855504"
export COLOR_13="#315EEE"
export COLOR_14="#930092"
export COLOR_15="#0E6FAD"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#F8F8F8"
export FOREGROUND_COLOR="#2A2B32"
export CURSOR_COLOR="#2A2B32"
export PROFILE_NAME="One Light"
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
