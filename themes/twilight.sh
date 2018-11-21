#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#141414"           # HOST
COLOR_02="#c06d44"           # SYNTAX_STRING
COLOR_03="#afb97a"           # COMMAND
COLOR_04="#c2a86c"           # COMMAND_COLOR2
COLOR_05="#44474a"           # PATH
COLOR_06="#b4be7c"           # SYNTAX_VAR
COLOR_07="#778385"           # PROMP
COLOR_08="#ffffd4"           #

COLOR_09="#262626"           #
COLOR_10="#de7c4c"           # COMMAND_ERROR
COLOR_11="#ccd88c"           # EXEC
COLOR_12="#e2c47e"           #
COLOR_13="#5a5e62"           # FOLDER
COLOR_14="#d0dc8e"           #
COLOR_15="#8a989b"           #
COLOR_16="#ffffd4"           #

BACKGROUND_COLOR="#141414"   # Background Color
FOREGROUND_COLOR="#ffffd4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Twilight"
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