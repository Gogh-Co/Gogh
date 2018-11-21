#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#F27779"
COLOR_03="#99CC99"
COLOR_04="#FFCC66"
COLOR_05="#6699CC"
COLOR_06="#CC99CC"
COLOR_07="#66CCCC"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#F17779"
COLOR_11="#99CC99"
COLOR_12="#FFCC66"
COLOR_13="#6699CC"
COLOR_14="#CC99CC"
COLOR_15="#66CCCC"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#2C2C2C"
FOREGROUND_COLOR="#CCCCCC"
CURSOR_COLOR="#CCCCCC"
PROFILE_NAME="Tomorrow Night Eighties"
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