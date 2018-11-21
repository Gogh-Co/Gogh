#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#e8341c"           # SYNTAX_STRING
COLOR_03="#68c256"           # COMMAND
COLOR_04="#f2d42c"           # COMMAND_COLOR2
COLOR_05="#1c98e8"           # PATH
COLOR_06="#8e69c9"           # SYNTAX_VAR
COLOR_07="#1c98e8"           # PROMP
COLOR_08="#bababa"           #

COLOR_09="#000000"           #
COLOR_10="#e05a4f"           # COMMAND_ERROR
COLOR_11="#77b869"           # EXEC
COLOR_12="#efd64b"           #
COLOR_13="#387cd3"           # FOLDER
COLOR_14="#957bbe"           #
COLOR_15="#3d97e2"           #
COLOR_16="#bababa"           #

BACKGROUND_COLOR="#222324"   # Background Color
FOREGROUND_COLOR="#bababa"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Darkside"
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