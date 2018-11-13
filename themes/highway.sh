#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d00e18"           # SYNTAX_STRING
COLOR_03="#138034"           # COMMAND
COLOR_04="#ffcb3e"           # COMMAND_COLOR2
COLOR_05="#006bb3"           # PATH
COLOR_06="#6b2775"           # SYNTAX_VAR
COLOR_07="#384564"           # PROMP
COLOR_08="#ededed"           #

COLOR_09="#5d504a"           #
COLOR_10="#f07e18"           # COMMAND_ERROR
COLOR_11="#b1d130"           # EXEC
COLOR_12="#fff120"           #
COLOR_13="#4fc2fd"           # FOLDER
COLOR_14="#de0071"           #
COLOR_15="#5d504a"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#222225"   # Background Color
FOREGROUND_COLOR="#ededed"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Highway"
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