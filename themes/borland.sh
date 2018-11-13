#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4f4f4f"           # HOST
COLOR_02="#ff6c60"           # SYNTAX_STRING
COLOR_03="#a8ff60"           # COMMAND
COLOR_04="#ffffb6"           # COMMAND_COLOR2
COLOR_05="#96cbfe"           # PATH
COLOR_06="#ff73fd"           # SYNTAX_VAR
COLOR_07="#c6c5fe"           # PROMP
COLOR_08="#eeeeee"           #

COLOR_09="#7c7c7c"           #
COLOR_10="#ffb6b0"           # COMMAND_ERROR
COLOR_11="#ceffac"           # EXEC
COLOR_12="#ffffcc"           #
COLOR_13="#b5dcff"           # FOLDER
COLOR_14="#ff9cfe"           #
COLOR_15="#dfdffe"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0000a4"   # Background Color
FOREGROUND_COLOR="#ffff4e"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Borland"
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