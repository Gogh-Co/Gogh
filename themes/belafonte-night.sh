#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#20111b"           # HOST
COLOR_02="#be100e"           # SYNTAX_STRING
COLOR_03="#858162"           # COMMAND
COLOR_04="#eaa549"           # COMMAND_COLOR2
COLOR_05="#426a79"           # PATH
COLOR_06="#97522c"           # SYNTAX_VAR
COLOR_07="#989a9c"           # PROMP
COLOR_08="#968c83"           #

COLOR_09="#5e5252"           #
COLOR_10="#be100e"           # COMMAND_ERROR
COLOR_11="#858162"           # EXEC
COLOR_12="#eaa549"           #
COLOR_13="#426a79"           # FOLDER
COLOR_14="#97522c"           #
COLOR_15="#989a9c"           #
COLOR_16="#d5ccba"           #

BACKGROUND_COLOR="#20111b"   # Background Color
FOREGROUND_COLOR="#968c83"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Belafonte Night"
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