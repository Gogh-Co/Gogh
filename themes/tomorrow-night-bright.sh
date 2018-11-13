#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#D54E53"
COLOR_03="#B9CA49"
COLOR_04="#E7C547"
COLOR_05="#79A6DA"
COLOR_06="#C397D8"
COLOR_07="#70C0B1"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#D44D53"
COLOR_11="#B9C949"
COLOR_12="#E6C446"
COLOR_13="#79A6DA"
COLOR_14="#C396D7"
COLOR_15="#70C0B1"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#E9E9E9"
CURSOR_COLOR="#E9E9E9"
PROFILE_NAME="Tomorrow Night Bright"
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
        eval "$(curl -so- "${BASE_URL}/apply-colors.sh")"
    else
        # Linux ships with wget
        eval "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
    fi
fi