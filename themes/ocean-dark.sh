#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4F4F4F"
COLOR_02="#AF4B57"
COLOR_03="#AFD383"
COLOR_04="#E5C079"
COLOR_05="#7D90A4"
COLOR_06="#A4799D"
COLOR_07="#85A6A5"
COLOR_08="#EEEDEE"

COLOR_09="#7B7B7B"
COLOR_10="#AF4B57"
COLOR_11="#CEFFAB"
COLOR_12="#FFFECC"
COLOR_13="#B5DCFE"
COLOR_14="#FB9BFE"
COLOR_15="#DFDFFD"
COLOR_16="#FEFFFE"

BACKGROUND_COLOR="#1C1F27"
FOREGROUND_COLOR="#979CAC"
CURSOR_COLOR="#979CAC"
PROFILE_NAME="Ocean Dark"
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