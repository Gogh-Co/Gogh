#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2f1e2e"           # HOST
COLOR_02="#ef6155"           # SYNTAX_STRING
COLOR_03="#48b685"           # COMMAND
COLOR_04="#fec418"           # COMMAND_COLOR2
COLOR_05="#06b6ef"           # PATH
COLOR_06="#815ba4"           # SYNTAX_VAR
COLOR_07="#5bc4bf"           # PROMP
COLOR_08="#a39e9b"           #

COLOR_09="#776e71"           #
COLOR_10="#ef6155"           # COMMAND_ERROR
COLOR_11="#48b685"           # EXEC
COLOR_12="#fec418"           #
COLOR_13="#06b6ef"           # FOLDER
COLOR_14="#815ba4"           #
COLOR_15="#5bc4bf"           #
COLOR_16="#e7e9db"           #

BACKGROUND_COLOR="#2f1e2e"   # Background Color
FOREGROUND_COLOR="#a39e9b"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Paraiso Dark"
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