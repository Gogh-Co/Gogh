#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#212121"           # HOST
COLOR_02="#c30771"           # SYNTAX_STRING
COLOR_03="#10a778"           # COMMAND
COLOR_04="#a89c14"           # COMMAND_COLOR2
COLOR_05="#008ec4"           # PATH
COLOR_06="#523c79"           # SYNTAX_VAR
COLOR_07="#20a5ba"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#424242"           #
COLOR_10="#fb007a"           # COMMAND_ERROR
COLOR_11="#5fd7af"           # EXEC
COLOR_12="#f3e430"           #
COLOR_13="#20bbfc"           # FOLDER
COLOR_14="#6855de"           #
COLOR_15="#4fb8cc"           #
COLOR_16="#f1f1f1"           #

BACKGROUND_COLOR="#212121"   # Background Color
FOREGROUND_COLOR="#f1f1f1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Pencil Dark"
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