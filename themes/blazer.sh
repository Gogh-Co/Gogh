#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b87a7a"           # SYNTAX_STRING
COLOR_03="#7ab87a"           # COMMAND
COLOR_04="#b8b87a"           # COMMAND_COLOR2
COLOR_05="#7a7ab8"           # PATH
COLOR_06="#b87ab8"           # SYNTAX_VAR
COLOR_07="#7ab8b8"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#262626"           #
COLOR_10="#dbbdbd"           # COMMAND_ERROR
COLOR_11="#bddbbd"           # EXEC
COLOR_12="#dbdbbd"           #
COLOR_13="#bdbddb"           # FOLDER
COLOR_14="#dbbddb"           #
COLOR_15="#bddbdb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0d1926"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Blazer"
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