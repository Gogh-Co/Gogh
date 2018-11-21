#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535"
COLOR_02="#E64569"
COLOR_03="#89D287"
COLOR_04="#DAB752"
COLOR_05="#439ECF"
COLOR_06="#D961DC"
COLOR_07="#64AAAF"
COLOR_08="#B3B3B3"

COLOR_09="#535353"
COLOR_10="#E4859A"
COLOR_11="#A2CCA1"
COLOR_12="#E1E387"
COLOR_13="#6FBBE2"
COLOR_14="#E586E7"
COLOR_15="#96DCDA"
COLOR_16="#DEDEDE"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#C7C7C7"
CURSOR_COLOR="#BBBBBB"
PROFILE_NAME="Peppermint"
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