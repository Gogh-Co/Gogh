#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#7325FA"           # SYNTAX_STRING
COLOR_03="#23E298"           # COMMAND
COLOR_04="#60D4DF"           # COMMAND_COLOR2
COLOR_05="#D08010"           # PATH
COLOR_06="#FF0087"           # SYNTAX_VAR
COLOR_07="#D0A843"           # PROMP
COLOR_08="#BBBBBB"           #

COLOR_09="#555555"           #
COLOR_10="#9D66F6"           # COMMAND_ERROR
COLOR_11="#5FE0B1"           # EXEC
COLOR_12="#6DF2FF"           #
COLOR_13="#FFAF00"           # FOLDER
COLOR_14="#FF87AF"           #
COLOR_15="#FFCE51"           #
COLOR_16="#FFFFFF"           #

BACKGROUND_COLOR="#1b1d1e"   # Background Color
FOREGROUND_COLOR="#BBBBBB"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Molokai"
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