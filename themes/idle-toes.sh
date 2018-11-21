#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#323232"           # HOST
COLOR_02="#d25252"           # SYNTAX_STRING
COLOR_03="#7fe173"           # COMMAND
COLOR_04="#ffc66d"           # COMMAND_COLOR2
COLOR_05="#4099ff"           # PATH
COLOR_06="#f680ff"           # SYNTAX_VAR
COLOR_07="#bed6ff"           # PROMP
COLOR_08="#eeeeec"           #

COLOR_09="#535353"           #
COLOR_10="#f07070"           # COMMAND_ERROR
COLOR_11="#9dff91"           # EXEC
COLOR_12="#ffe48b"           #
COLOR_13="#5eb7f7"           # FOLDER
COLOR_14="#ff9dff"           #
COLOR_15="#dcf4ff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#323232"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Idle Toes"
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