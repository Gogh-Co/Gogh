#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#F27779"
export COLOR_03="#99CC99"
export COLOR_04="#FFCC66"
export COLOR_05="#6699CC"
export COLOR_06="#CC99CC"
export COLOR_07="#66CCCC"
export COLOR_08="#FFFEFE"

export COLOR_09="#000000"
export COLOR_10="#F17779"
export COLOR_11="#99CC99"
export COLOR_12="#FFCC66"
export COLOR_13="#6699CC"
export COLOR_14="#CC99CC"
export COLOR_15="#66CCCC"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#2C2C2C"
export FOREGROUND_COLOR="#CCCCCC"
export CURSOR_COLOR="#CCCCCC"
export PROFILE_NAME="Tomorrow Night Eighties"
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
