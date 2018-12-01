#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#D54E53"
export COLOR_03="#B9CA49"
export COLOR_04="#E7C547"
export COLOR_05="#79A6DA"
export COLOR_06="#C397D8"
export COLOR_07="#70C0B1"
export COLOR_08="#FFFEFE"

export COLOR_09="#000000"
export COLOR_10="#D44D53"
export COLOR_11="#B9C949"
export COLOR_12="#E6C446"
export COLOR_13="#79A6DA"
export COLOR_14="#C396D7"
export COLOR_15="#70C0B1"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#000000"
export FOREGROUND_COLOR="#E9E9E9"
export CURSOR_COLOR="#E9E9E9"
export PROFILE_NAME="Tomorrow Night Bright"
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
