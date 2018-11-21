#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2f2e2d"           # HOST
COLOR_02="#a36666"           # SYNTAX_STRING
COLOR_03="#90a57d"           # COMMAND
COLOR_04="#d7af87"           # COMMAND_COLOR2
COLOR_05="#7fa5bd"           # PATH
COLOR_06="#c79ec4"           # SYNTAX_VAR
COLOR_07="#8adbb4"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#4a4845"           #
COLOR_10="#d78787"           # COMMAND_ERROR
COLOR_11="#afbea2"           # EXEC
COLOR_12="#e4c9af"           #
COLOR_13="#a1bdce"           # FOLDER
COLOR_14="#d7beda"           #
COLOR_15="#b1e7dd"           #
COLOR_16="#efefef"           #

BACKGROUND_COLOR="#1c1c1c"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Pnevma"
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