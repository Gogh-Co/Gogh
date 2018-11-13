#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#757575"           # HOST
COLOR_02="#825d4d"           # SYNTAX_STRING
COLOR_03="#728c62"           # COMMAND
COLOR_04="#ada16d"           # COMMAND_COLOR2
COLOR_05="#4d7b82"           # PATH
COLOR_06="#8a7267"           # SYNTAX_VAR
COLOR_07="#729494"           # PROMP
COLOR_08="#e0e0e0"           #

COLOR_09="#8a8a8a"           #
COLOR_10="#cf937a"           # COMMAND_ERROR
COLOR_11="#98d9aa"           # EXEC
COLOR_12="#fae79d"           #
COLOR_13="#7ac3cf"           # FOLDER
COLOR_14="#d6b2a1"           #
COLOR_15="#ade0e0"           #
COLOR_16="#e0e0e0"           #

BACKGROUND_COLOR="#243435"   # Background Color
FOREGROUND_COLOR="#d4e7d4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Seafoam Pastel"
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