#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#242526"           # HOST
COLOR_02="#f8511b"           # SYNTAX_STRING
COLOR_03="#565747"           # COMMAND
COLOR_04="#fa771d"           # COMMAND_COLOR2
COLOR_05="#2c70b7"           # PATH
COLOR_06="#f02e4f"           # SYNTAX_VAR
COLOR_07="#3ca1a6"           # PROMP
COLOR_08="#adadad"           #

COLOR_09="#5fac6d"           #
COLOR_10="#f74319"           # COMMAND_ERROR
COLOR_11="#74ec4c"           # EXEC
COLOR_12="#fdc325"           #
COLOR_13="#3393ca"           # FOLDER
COLOR_14="#e75e4f"           #
COLOR_15="#4fbce6"           #
COLOR_16="#8c735b"           #

BACKGROUND_COLOR="#1b1c1d"   # Background Color
FOREGROUND_COLOR="#adadad"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Frontend Delight"
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