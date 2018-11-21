#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535" #black
COLOR_02="#E64569" #red
COLOR_03="#89D287" #green
COLOR_04="#DAB752" #yellow
COLOR_05="#439ECF" #blue
COLOR_06="#D961DC" #magenta
COLOR_07="#64AAAF" #cyan
COLOR_08="#B3B3B3" #white

COLOR_09="#535353" #lightBlack
COLOR_10="#E4859A" #lightRed
COLOR_11="#A2CCA1" #lightGreen
COLOR_12="#E1E387" #lightYellow
COLOR_13="#6FBBE2" #lightBlue
COLOR_14="#E586E7" #lightMagenta
COLOR_15="#96DCDA" #lightCyan
COLOR_16="#DEDEDE" #lightWhite

BACKGROUND_COLOR="#ebeaf2"
FOREGROUND_COLOR="#004f7c"
CURSOR_COLOR=$COLOR_05
PROFILE_NAME="Nord Light"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [ -e "${PARENT_PATH}/apply-colors.sh" ]
then
    source "${PARENT_PATH}/apply-colors.sh"
else
    if [ "$(uname)" = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        (eval "$(curl -so- "${BASE_URL}/apply-colors.sh")")
    else
        # Linux ships with wget
        (eval "$(wget -qO- "${BASE_URL}/apply-colors.sh")")
    fi
fi