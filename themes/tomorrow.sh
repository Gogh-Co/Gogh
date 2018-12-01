#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#C82828"
export COLOR_03="#718C00"
export COLOR_04="#EAB700"
export COLOR_05="#4171AE"
export COLOR_06="#8959A8"
export COLOR_07="#3E999F"
export COLOR_08="#FFFEFE"

export COLOR_09="#000000"
export COLOR_10="#C82828"
export COLOR_11="#708B00"
export COLOR_12="#E9B600"
export COLOR_13="#4170AE"
export COLOR_14="#8958A7"
export COLOR_15="#3D999F"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#FFFFFF"
export FOREGROUND_COLOR="#4D4D4C"
export CURSOR_COLOR="#4C4C4C"
export PROFILE_NAME="Tomorrow"
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
