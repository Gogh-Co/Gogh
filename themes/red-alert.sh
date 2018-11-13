#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d62e4e"           # SYNTAX_STRING
COLOR_03="#71be6b"           # COMMAND
COLOR_04="#beb86b"           # COMMAND_COLOR2
COLOR_05="#489bee"           # PATH
COLOR_06="#e979d7"           # SYNTAX_VAR
COLOR_07="#6bbeb8"           # PROMP
COLOR_08="#d6d6d6"           #

COLOR_09="#262626"           #
COLOR_10="#e02553"           # COMMAND_ERROR
COLOR_11="#aff08c"           # EXEC
COLOR_12="#dfddb7"           #
COLOR_13="#65aaf1"           # FOLDER
COLOR_14="#ddb7df"           #
COLOR_15="#b7dfdd"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#762423"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Red Alert"
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