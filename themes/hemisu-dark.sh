#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#444444"
COLOR_02="#FF0054"
COLOR_03="#B1D630"
COLOR_04="#9D895E"
COLOR_05="#67BEE3"
COLOR_06="#B576BC"
COLOR_07="#569A9F"
COLOR_08="#EDEDED"

COLOR_09="#777777"
COLOR_10="#D65E75"
COLOR_11="#BAFFAA"
COLOR_12="#ECE1C8"
COLOR_13="#9FD3E5"
COLOR_14="#DEB3DF"
COLOR_15="#B6E0E5"
COLOR_16="#FFFFFF"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#FFFFFF"
CURSOR_COLOR="#BAFFAA"
PROFILE_NAME="Hemisu Dark"
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