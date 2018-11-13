#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#FF9DA3"
COLOR_03="#D1F1A9"
COLOR_04="#FFEEAD"
COLOR_05="#BBDAFF"
COLOR_06="#EBBBFF"
COLOR_07="#99FFFF"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#FF9CA3"
COLOR_11="#D0F0A8"
COLOR_12="#FFEDAC"
COLOR_13="#BADAFF"
COLOR_14="#EBBAFF"
COLOR_15="#99FFFF"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#002451"
FOREGROUND_COLOR="#FFFEFE"
CURSOR_COLOR="#FFFEFE"
PROFILE_NAME="Tomorrow Night Blue"
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