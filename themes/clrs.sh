#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#f8282a"           # SYNTAX_STRING
COLOR_03="#328a5d"           # COMMAND
COLOR_04="#fa701d"           # COMMAND_COLOR2
COLOR_05="#135cd0"           # PATH
COLOR_06="#9f00bd"           # SYNTAX_VAR
COLOR_07="#33c3c1"           # PROMP
COLOR_08="#b3b3b3"           #

COLOR_09="#555753"           #
COLOR_10="#fb0416"           # COMMAND_ERROR
COLOR_11="#2cc631"           # EXEC
COLOR_12="#fdd727"           #
COLOR_13="#1670ff"           # FOLDER
COLOR_14="#e900b0"           #
COLOR_15="#3ad5ce"           #
COLOR_16="#eeeeec"           #

BACKGROUND_COLOR="#ffffff"   # Background Color
FOREGROUND_COLOR="#262626"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="CLRS"
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