#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#705050"           # SYNTAX_STRING
COLOR_03="#60b48a"           # COMMAND
COLOR_04="#f0dfaf"           # COMMAND_COLOR2
COLOR_05="#506070"           # PATH
COLOR_06="#dc8cc3"           # SYNTAX_VAR
COLOR_07="#8cd0d3"           # PROMP
COLOR_08="#dcdccc"           #

COLOR_09="#709080"           #
COLOR_10="#dca3a3"           # COMMAND_ERROR
COLOR_11="#c3bf9f"           # EXEC
COLOR_12="#e0cf9f"           #
COLOR_13="#94bff3"           # FOLDER
COLOR_14="#ec93d3"           #
COLOR_15="#93e0e3"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#3f3f3f"   # Background Color
FOREGROUND_COLOR="#dcdccc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Zenburn"
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