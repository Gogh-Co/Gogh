#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#777777"
COLOR_02="#FF0055"
COLOR_03="#739100"
COLOR_04="#503D15"
COLOR_05="#538091"
COLOR_06="#5B345E"
COLOR_07="#538091"
COLOR_08="#999999"

COLOR_09="#999999"
COLOR_10="#D65E76"
COLOR_11="#9CC700"
COLOR_12="#947555"
COLOR_13="#9DB3CD"
COLOR_14="#A184A4"
COLOR_15="#85B2AA"
COLOR_16="#BABABA"

BACKGROUND_COLOR="#EFEFEF"
FOREGROUND_COLOR="#444444"
CURSOR_COLOR="#FF0054"
PROFILE_NAME="Hemisu Light"
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