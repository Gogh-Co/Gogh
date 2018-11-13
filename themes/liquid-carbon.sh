#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff3030"           # SYNTAX_STRING
COLOR_03="#559a70"           # COMMAND
COLOR_04="#ccac00"           # COMMAND_COLOR2
COLOR_05="#0099cc"           # PATH
COLOR_06="#cc69c8"           # SYNTAX_VAR
COLOR_07="#7ac4cc"           # PROMP
COLOR_08="#bccccc"           #

COLOR_09="#000000"           #
COLOR_10="#ff3030"           # COMMAND_ERROR
COLOR_11="#559a70"           # EXEC
COLOR_12="#ccac00"           #
COLOR_13="#0099cc"           # FOLDER
COLOR_14="#cc69c8"           #
COLOR_15="#7ac4cc"           #
COLOR_16="#bccccc"           #

BACKGROUND_COLOR="#303030"   # Background Color
FOREGROUND_COLOR="#afc2c2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Liquid Carbon"
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