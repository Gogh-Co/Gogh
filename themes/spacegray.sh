#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b04b57"           # SYNTAX_STRING
COLOR_03="#87b379"           # COMMAND
COLOR_04="#e5c179"           # COMMAND_COLOR2
COLOR_05="#7d8fa4"           # PATH
COLOR_06="#a47996"           # SYNTAX_VAR
COLOR_07="#85a7a5"           # PROMP
COLOR_08="#b3b8c3"           #

COLOR_09="#000000"           #
COLOR_10="#b04b57"           # COMMAND_ERROR
COLOR_11="#87b379"           # EXEC
COLOR_12="#e5c179"           #
COLOR_13="#7d8fa4"           # FOLDER
COLOR_14="#a47996"           #
COLOR_15="#85a7a5"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#20242d"   # Background Color
FOREGROUND_COLOR="#b3b8c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="SpaceGray"
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