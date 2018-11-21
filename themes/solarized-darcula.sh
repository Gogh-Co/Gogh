#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#25292a"           # HOST
COLOR_02="#f24840"           # SYNTAX_STRING
COLOR_03="#629655"           # COMMAND
COLOR_04="#b68800"           # COMMAND_COLOR2
COLOR_05="#2075c7"           # PATH
COLOR_06="#797fd4"           # SYNTAX_VAR
COLOR_07="#15968d"           # PROMP
COLOR_08="#d2d8d9"           #

COLOR_09="#25292a"           #
COLOR_10="#f24840"           # COMMAND_ERROR
COLOR_11="#629655"           # EXEC
COLOR_12="#b68800"           #
COLOR_13="#2075c7"           # FOLDER
COLOR_14="#797fd4"           #
COLOR_15="#15968d"           #
COLOR_16="#d2d8d9"           #

BACKGROUND_COLOR="#3d3f41"   # Background Color
FOREGROUND_COLOR="#d2d8d9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Darcula"
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