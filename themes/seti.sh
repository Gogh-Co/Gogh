#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#323232"           # HOST
COLOR_02="#c22832"           # SYNTAX_STRING
COLOR_03="#8ec43d"           # COMMAND
COLOR_04="#e0c64f"           # COMMAND_COLOR2
COLOR_05="#43a5d5"           # PATH
COLOR_06="#8b57b5"           # SYNTAX_VAR
COLOR_07="#8ec43d"           # PROMP
COLOR_08="#eeeeee"           #

COLOR_09="#323232"           #
COLOR_10="#c22832"           # COMMAND_ERROR
COLOR_11="#8ec43d"           # EXEC
COLOR_12="#e0c64f"           #
COLOR_13="#43a5d5"           # FOLDER
COLOR_14="#8b57b5"           #
COLOR_15="#8ec43d"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#111213"   # Background Color
FOREGROUND_COLOR="#cacecd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Seti"
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