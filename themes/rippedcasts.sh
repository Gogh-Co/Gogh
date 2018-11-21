#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cdaf95"           # SYNTAX_STRING
COLOR_03="#a8ff60"           # COMMAND
COLOR_04="#bfbb1f"           # COMMAND_COLOR2
COLOR_05="#75a5b0"           # PATH
COLOR_06="#ff73fd"           # SYNTAX_VAR
COLOR_07="#5a647e"           # PROMP
COLOR_08="#bfbfbf"           #

COLOR_09="#666666"           #
COLOR_10="#eecbad"           # COMMAND_ERROR
COLOR_11="#bcee68"           # EXEC
COLOR_12="#e5e500"           #
COLOR_13="#86bdc9"           # FOLDER
COLOR_14="#e500e5"           #
COLOR_15="#8c9bc4"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#2b2b2b"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Rippedcasts"
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