#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1f1f1f"           # HOST
COLOR_02="#f81118"           # SYNTAX_STRING
COLOR_03="#2dc55e"           # COMMAND
COLOR_04="#ecba0f"           # COMMAND_COLOR2
COLOR_05="#2a84d2"           # PATH
COLOR_06="#4e5ab7"           # SYNTAX_VAR
COLOR_07="#1081d6"           # PROMP
COLOR_08="#d6dbe5"           #

COLOR_09="#d6dbe5"           #
COLOR_10="#de352e"           # COMMAND_ERROR
COLOR_11="#1dd361"           # EXEC
COLOR_12="#f3bd09"           #
COLOR_13="#1081d6"           # FOLDER
COLOR_14="#5350b9"           #
COLOR_15="#0f7ddb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#131313"   # Background Color
FOREGROUND_COLOR="#d6dbe5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Brogrammer"
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