#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cc0000"           # SYNTAX_STRING
COLOR_03="#1a921c"           # COMMAND
COLOR_04="#f0e53a"           # COMMAND_COLOR2
COLOR_05="#0066ff"           # PATH
COLOR_06="#c5656b"           # SYNTAX_VAR
COLOR_07="#06989a"           # PROMP
COLOR_08="#d3d7cf"           #

COLOR_09="#555753"           #
COLOR_10="#ef2929"           # COMMAND_ERROR
COLOR_11="#9aff87"           # EXEC
COLOR_12="#fffb5c"           #
COLOR_13="#43a8ed"           # FOLDER
COLOR_14="#ff818a"           #
COLOR_15="#34e2e2"           #
COLOR_16="#eeeeec"           #

BACKGROUND_COLOR="#2a211c"   # Background Color
FOREGROUND_COLOR="#b8a898"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Espresso Libre"
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