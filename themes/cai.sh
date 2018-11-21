#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ca274d"           # SYNTAX_STRING
COLOR_03="#4dca27"           # COMMAND
COLOR_04="#caa427"           # COMMAND_COLOR2
COLOR_05="#274dca"           # PATH
COLOR_06="#a427ca"           # SYNTAX_VAR
COLOR_07="#27caa4"           # PROMP
COLOR_08="#808080"           #

COLOR_09="#808080"           #
COLOR_10="#e98da3"           # COMMAND_ERROR
COLOR_11="#a3e98d"           # EXEC
COLOR_12="#e9d48d"           #
COLOR_13="#8da3e9"           # FOLDER
COLOR_14="#d48de9"           #
COLOR_15="#8de9d4"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#09111a"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Cai"
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