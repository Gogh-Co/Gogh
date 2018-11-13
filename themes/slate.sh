#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#222222"           # HOST
COLOR_02="#e2a8bf"           # SYNTAX_STRING
COLOR_03="#81d778"           # COMMAND
COLOR_04="#c4c9c0"           # COMMAND_COLOR2
COLOR_05="#264b49"           # PATH
COLOR_06="#a481d3"           # SYNTAX_VAR
COLOR_07="#15ab9c"           # PROMP
COLOR_08="#02c5e0"           #

COLOR_09="#ffffff"           #
COLOR_10="#ffcdd9"           # COMMAND_ERROR
COLOR_11="#beffa8"           # EXEC
COLOR_12="#d0ccca"           #
COLOR_13="#7ab0d2"           # FOLDER
COLOR_14="#c5a7d9"           #
COLOR_15="#8cdfe0"           #
COLOR_16="#e0e0e0"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#35b1d2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Slate"
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