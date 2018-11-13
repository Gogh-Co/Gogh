#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#ff2b2b"           # SYNTAX_STRING
COLOR_03="#98fb98"           # COMMAND
COLOR_04="#f0e68c"           # COMMAND_COLOR2
COLOR_05="#cd853f"           # PATH
COLOR_06="#ffdead"           # SYNTAX_VAR
COLOR_07="#ffa0a0"           # PROMP
COLOR_08="#f5deb3"           #

COLOR_09="#555555"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#55ff55"           # EXEC
COLOR_12="#ffff55"           #
COLOR_13="#87ceff"           # FOLDER
COLOR_14="#ff55ff"           #
COLOR_15="#ffd700"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#333333"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Desert"
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