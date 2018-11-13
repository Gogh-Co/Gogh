#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#002831"           # HOST
COLOR_02="#d11c24"           # SYNTAX_STRING
COLOR_03="#6cbe6c"           # COMMAND
COLOR_04="#a57706"           # COMMAND_COLOR2
COLOR_05="#2176c7"           # PATH
COLOR_06="#c61c6f"           # SYNTAX_VAR
COLOR_07="#259286"           # PROMP
COLOR_08="#eae3cb"           #

COLOR_09="#006488"           #
COLOR_10="#f5163b"           # COMMAND_ERROR
COLOR_11="#51ef84"           # EXEC
COLOR_12="#b27e28"           #
COLOR_13="#178ec8"           # FOLDER
COLOR_14="#e24d8e"           #
COLOR_15="#00b39e"           #
COLOR_16="#fcf4dc"           #

BACKGROUND_COLOR="#001e27"   # Background Color
FOREGROUND_COLOR="#9cc2c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Dark Higher Contrast"
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