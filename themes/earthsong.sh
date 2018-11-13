#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#121418"           # HOST
COLOR_02="#c94234"           # SYNTAX_STRING
COLOR_03="#85c54c"           # COMMAND
COLOR_04="#f5ae2e"           # COMMAND_COLOR2
COLOR_05="#1398b9"           # PATH
COLOR_06="#d0633d"           # SYNTAX_VAR
COLOR_07="#509552"           # PROMP
COLOR_08="#e5c6aa"           #

COLOR_09="#675f54"           #
COLOR_10="#ff645a"           # COMMAND_ERROR
COLOR_11="#98e036"           # EXEC
COLOR_12="#e0d561"           #
COLOR_13="#5fdaff"           # FOLDER
COLOR_14="#ff9269"           #
COLOR_15="#84f088"           #
COLOR_16="#f6f7ec"           #

BACKGROUND_COLOR="#292520"   # Background Color
FOREGROUND_COLOR="#e5c7a9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Earthsong"
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