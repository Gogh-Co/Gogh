#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2a2a2a"           # HOST
COLOR_02="#ff0000"           # SYNTAX_STRING
COLOR_03="#79ff0f"           # COMMAND
COLOR_04="#d3bf00"           # COMMAND_COLOR2
COLOR_05="#396bd7"           # PATH
COLOR_06="#b449be"           # SYNTAX_VAR
COLOR_07="#66ccff"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#666666"           #
COLOR_10="#ff0080"           # COMMAND_ERROR
COLOR_11="#66ff66"           # EXEC
COLOR_12="#f3d64e"           #
COLOR_13="#709aed"           # FOLDER
COLOR_14="#db67e6"           #
COLOR_15="#7adff2"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#f2f2f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Paul Millr"
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