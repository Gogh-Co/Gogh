#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff615a"           # SYNTAX_STRING
COLOR_03="#b1e969"           # COMMAND
COLOR_04="#ebd99c"           # COMMAND_COLOR2
COLOR_05="#5da9f6"           # PATH
COLOR_06="#e86aff"           # SYNTAX_VAR
COLOR_07="#82fff7"           # PROMP
COLOR_08="#dedacf"           #

COLOR_09="#313131"           #
COLOR_10="#f58c80"           # COMMAND_ERROR
COLOR_11="#ddf88f"           # EXEC
COLOR_12="#eee5b2"           #
COLOR_13="#a5c7ff"           # FOLDER
COLOR_14="#ddaaff"           #
COLOR_15="#b7fff9"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#171717"   # Background Color
FOREGROUND_COLOR="#dedacf"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Wombat"
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