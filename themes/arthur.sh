#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3d352a"           # HOST
COLOR_02="#cd5c5c"           # SYNTAX_STRING
COLOR_03="#86af80"           # COMMAND
COLOR_04="#e8ae5b"           # COMMAND_COLOR2
COLOR_05="#6495ed"           # PATH
COLOR_06="#deb887"           # SYNTAX_VAR
COLOR_07="#b0c4de"           # PROMP
COLOR_08="#bbaa99"           #

COLOR_09="#554444"           #
COLOR_10="#cc5533"           # COMMAND_ERROR
COLOR_11="#88aa22"           # EXEC
COLOR_12="#ffa75d"           #
COLOR_13="#87ceeb"           # FOLDER
COLOR_14="#996600"           #
COLOR_15="#b0c4de"           #
COLOR_16="#ddccbb"           #

BACKGROUND_COLOR="#1c1c1c"   # Background Color
FOREGROUND_COLOR="#ddeedd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Arthur"
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