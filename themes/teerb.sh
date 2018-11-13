#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1c1c1c"           # HOST
COLOR_02="#d68686"           # SYNTAX_STRING
COLOR_03="#aed686"           # COMMAND
COLOR_04="#d7af87"           # COMMAND_COLOR2
COLOR_05="#86aed6"           # PATH
COLOR_06="#d6aed6"           # SYNTAX_VAR
COLOR_07="#8adbb4"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#1c1c1c"           #
COLOR_10="#d68686"           # COMMAND_ERROR
COLOR_11="#aed686"           # EXEC
COLOR_12="#e4c9af"           #
COLOR_13="#86aed6"           # FOLDER
COLOR_14="#d6aed6"           #
COLOR_15="#b1e7dd"           #
COLOR_16="#efefef"           #

BACKGROUND_COLOR="#262626"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Teerb"
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