#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#302b2a"           # HOST
COLOR_02="#a7463d"           # SYNTAX_STRING
COLOR_03="#587744"           # COMMAND
COLOR_04="#9d602a"           # COMMAND_COLOR2
COLOR_05="#485b98"           # PATH
COLOR_06="#864651"           # SYNTAX_VAR
COLOR_07="#9c814f"           # PROMP
COLOR_08="#c9c9c9"           #

COLOR_09="#4d4e48"           #
COLOR_10="#aa000c"           # COMMAND_ERROR
COLOR_11="#128c21"           # EXEC
COLOR_12="#fc6a21"           #
COLOR_13="#7999f7"           # FOLDER
COLOR_14="#fd8aa1"           #
COLOR_15="#fad484"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1a1818"   # Background Color
FOREGROUND_COLOR="#c9c9c9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sundried"
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