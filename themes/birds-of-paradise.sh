#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#573d26"           # HOST
COLOR_02="#be2d26"           # SYNTAX_STRING
COLOR_03="#6ba18a"           # COMMAND
COLOR_04="#e99d2a"           # COMMAND_COLOR2
COLOR_05="#5a86ad"           # PATH
COLOR_06="#ac80a6"           # SYNTAX_VAR
COLOR_07="#74a6ad"           # PROMP
COLOR_08="#e0dbb7"           #

COLOR_09="#9b6c4a"           #
COLOR_10="#e84627"           # COMMAND_ERROR
COLOR_11="#95d8ba"           # EXEC
COLOR_12="#d0d150"           #
COLOR_13="#b8d3ed"           # FOLDER
COLOR_14="#d19ecb"           #
COLOR_15="#93cfd7"           #
COLOR_16="#fff9d5"           #

BACKGROUND_COLOR="#2a1f1d"   # Background Color
FOREGROUND_COLOR="#e0dbb7"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Birds Of Paradise"
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