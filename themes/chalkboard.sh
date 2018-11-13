#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#c37372"           # SYNTAX_STRING
COLOR_03="#72c373"           # COMMAND
COLOR_04="#c2c372"           # COMMAND_COLOR2
COLOR_05="#7372c3"           # PATH
COLOR_06="#c372c2"           # SYNTAX_VAR
COLOR_07="#72c2c3"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#323232"           #
COLOR_10="#dbaaaa"           # COMMAND_ERROR
COLOR_11="#aadbaa"           # EXEC
COLOR_12="#dadbaa"           #
COLOR_13="#aaaadb"           # FOLDER
COLOR_14="#dbaada"           #
COLOR_15="#aadadb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#29262f"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Chalkboard"
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