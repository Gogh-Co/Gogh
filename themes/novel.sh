#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cc0000"           # SYNTAX_STRING
COLOR_03="#009600"           # COMMAND
COLOR_04="#d06b00"           # COMMAND_COLOR2
COLOR_05="#0000cc"           # PATH
COLOR_06="#cc00cc"           # SYNTAX_VAR
COLOR_07="#0087cc"           # PROMP
COLOR_08="#cccccc"           #

COLOR_09="#808080"           #
COLOR_10="#cc0000"           # COMMAND_ERROR
COLOR_11="#009600"           # EXEC
COLOR_12="#d06b00"           #
COLOR_13="#0000cc"           # FOLDER
COLOR_14="#cc00cc"           #
COLOR_15="#0087cc"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#dfdbc3"   # Background Color
FOREGROUND_COLOR="#3b2322"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Novel"
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