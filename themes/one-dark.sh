#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"
export COLOR_02="#E06C75"
export COLOR_03="#98C379"
export COLOR_04="#D19A66"
export COLOR_05="#61AFEF"
export COLOR_06="#C678DD"
export COLOR_07="#56B6C2"
export COLOR_08="#ABB2BF"

export COLOR_09="#5C6370"
export COLOR_10="#E06C75"
export COLOR_11="#98C379"
export COLOR_12="#D19A66"
export COLOR_13="#61AFEF"
export COLOR_14="#C678DD"
export COLOR_15="#56B6C2"
export COLOR_16="#FFFEFE"

export BACKGROUND_COLOR="#1E2127"
export FOREGROUND_COLOR="#5C6370"
export CURSOR_COLOR="#5C6370"
export PROFILE_NAME="One Dark"
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
