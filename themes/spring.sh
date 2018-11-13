#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff4d83"           # SYNTAX_STRING
COLOR_03="#1f8c3b"           # COMMAND
COLOR_04="#1fc95b"           # COMMAND_COLOR2
COLOR_05="#1dd3ee"           # PATH
COLOR_06="#8959a8"           # SYNTAX_VAR
COLOR_07="#3e999f"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#000000"           #
COLOR_10="#ff0021"           # COMMAND_ERROR
COLOR_11="#1fc231"           # EXEC
COLOR_12="#d5b807"           #
COLOR_13="#15a9fd"           # FOLDER
COLOR_14="#8959a8"           #
COLOR_15="#3e999f"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0a1e24"   # Background Color
FOREGROUND_COLOR="#ecf0c1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Spring"
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