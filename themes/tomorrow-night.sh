#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#CC6666"
export COLOR_03="#B5BD68"
export COLOR_04="#F0C674"
export COLOR_05="#81A2BE"
export COLOR_06="#B293BB"
export COLOR_07="#8ABEB7"
export COLOR_08="#FFFEFE"

export COLOR_09="#000000"
export COLOR_10="#CC6666"
export COLOR_11="#B5BD68"
export COLOR_12="#F0C574"
export COLOR_13="#80A1BD"
export COLOR_14="#B294BA"
export COLOR_15="#8ABDB6"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#1D1F21"
export FOREGROUND_COLOR="#C5C8C6"
export CURSOR_COLOR="#C4C8C5"
export PROFILE_NAME="Tomorrow Night"
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
