#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#4df840"           # COMMAND
COLOR_04="#f4fd22"           # COMMAND_COLOR2
COLOR_05="#2757d6"           # PATH
COLOR_06="#8c54fe"           # SYNTAX_VAR
COLOR_07="#38c8b5"           # PROMP
COLOR_08="#ccccc6"           #

COLOR_09="#505354"           #
COLOR_10="#ff5995"           # COMMAND_ERROR
COLOR_11="#b6e354"           # EXEC
COLOR_12="#feed6c"           #
COLOR_13="#3f78ff"           # FOLDER
COLOR_14="#9e6ffe"           #
COLOR_15="#23cfd5"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#1b1d1e"   # Background Color
FOREGROUND_COLOR="#f8f8f8"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Thayer Bright"
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