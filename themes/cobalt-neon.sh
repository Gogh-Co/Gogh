#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#142631"           # HOST
COLOR_02="#ff2320"           # SYNTAX_STRING
COLOR_03="#3ba5ff"           # COMMAND
COLOR_04="#e9e75c"           # COMMAND_COLOR2
COLOR_05="#8ff586"           # PATH
COLOR_06="#781aa0"           # SYNTAX_VAR
COLOR_07="#8ff586"           # PROMP
COLOR_08="#ba46b2"           #

COLOR_09="#fff688"           #
COLOR_10="#d4312e"           # COMMAND_ERROR
COLOR_11="#8ff586"           # EXEC
COLOR_12="#e9f06d"           #
COLOR_13="#3c7dd2"           # FOLDER
COLOR_14="#8230a7"           #
COLOR_15="#6cbc67"           #
COLOR_16="#8ff586"           #

BACKGROUND_COLOR="#142838"   # Background Color
FOREGROUND_COLOR="#8ff586"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Cobalt Neon"
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