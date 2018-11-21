#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#dc322f"           # SYNTAX_STRING
COLOR_03="#56db3a"           # COMMAND
COLOR_04="#ff8400"           # COMMAND_COLOR2
COLOR_05="#0084d4"           # PATH
COLOR_06="#b729d9"           # SYNTAX_VAR
COLOR_07="#ccccff"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#1b1d21"           #
COLOR_10="#dc322f"           # COMMAND_ERROR
COLOR_11="#56db3a"           # EXEC
COLOR_12="#ff8400"           #
COLOR_13="#0084d4"           # FOLDER
COLOR_14="#b729d9"           #
COLOR_15="#ccccff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Symphonic"
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