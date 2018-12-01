#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#353535"
export COLOR_02="#E64569"
export COLOR_03="#89D287"
export COLOR_04="#DAB752"
export COLOR_05="#439ECF"
export COLOR_06="#D961DC"
export COLOR_07="#64AAAF"
export COLOR_08="#B3B3B3"

export COLOR_09="#535353"
export COLOR_10="#E4859A"
export COLOR_11="#A2CCA1"
export COLOR_12="#E1E387"
export COLOR_13="#6FBBE2"
export COLOR_14="#E586E7"
export COLOR_15="#96DCDA"
export COLOR_16="#DEDEDE"

export BACKGROUND_COLOR="#000000"
export FOREGROUND_COLOR="#C7C7C7"
export CURSOR_COLOR="#BBBBBB"
export PROFILE_NAME="Peppermint"
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
