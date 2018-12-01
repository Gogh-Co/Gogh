#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#FF9DA3"
export COLOR_03="#D1F1A9"
export COLOR_04="#FFEEAD"
export COLOR_05="#BBDAFF"
export COLOR_06="#EBBBFF"
export COLOR_07="#99FFFF"
export COLOR_08="#FFFEFE"

export COLOR_09="#000000"
export COLOR_10="#FF9CA3"
export COLOR_11="#D0F0A8"
export COLOR_12="#FFEDAC"
export COLOR_13="#BADAFF"
export COLOR_14="#EBBAFF"
export COLOR_15="#99FFFF"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#002451"
export FOREGROUND_COLOR="#FFFEFE"
export CURSOR_COLOR="#FFFEFE"
export PROFILE_NAME="Tomorrow Night Blue"
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
