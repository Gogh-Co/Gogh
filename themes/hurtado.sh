#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#575757"           # HOST
COLOR_02="#ff1b00"           # SYNTAX_STRING
COLOR_03="#a5e055"           # COMMAND
COLOR_04="#fbe74a"           # COMMAND_COLOR2
COLOR_05="#496487"           # PATH
COLOR_06="#fd5ff1"           # SYNTAX_VAR
COLOR_07="#86e9fe"           # PROMP
COLOR_08="#cbcccb"           #

COLOR_09="#262626"           #
COLOR_10="#d51d00"           # COMMAND_ERROR
COLOR_11="#a5df55"           # EXEC
COLOR_12="#fbe84a"           #
COLOR_13="#89beff"           # FOLDER
COLOR_14="#c001c1"           #
COLOR_15="#86eafe"           #
COLOR_16="#dbdbdb"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#dbdbdb"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hurtado"
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