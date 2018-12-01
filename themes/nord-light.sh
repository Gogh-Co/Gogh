#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#353535" #black
export COLOR_02="#E64569" #red
export COLOR_03="#89D287" #green
export COLOR_04="#DAB752" #yellow
export COLOR_05="#439ECF" #blue
export COLOR_06="#D961DC" #magenta
export COLOR_07="#64AAAF" #cyan
export COLOR_08="#B3B3B3" #white

export COLOR_09="#535353" #lightBlack
export COLOR_10="#E4859A" #lightRed
export COLOR_11="#A2CCA1" #lightGreen
export COLOR_12="#E1E387" #lightYellow
export COLOR_13="#6FBBE2" #lightBlue
export COLOR_14="#E586E7" #lightMagenta
export COLOR_15="#96DCDA" #lightCyan
export COLOR_16="#DEDEDE" #lightWhite

export BACKGROUND_COLOR="#ebeaf2"
export FOREGROUND_COLOR="#004f7c"
export CURSOR_COLOR=$COLOR_05
export PROFILE_NAME="Nord Light"
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
