#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#351b0e"           # HOST
COLOR_02="#9b291c"           # SYNTAX_STRING
COLOR_03="#636232"           # COMMAND
COLOR_04="#c36e28"           # COMMAND_COLOR2
COLOR_05="#515c5d"           # PATH
COLOR_06="#9b1d29"           # SYNTAX_VAR
COLOR_07="#588056"           # PROMP
COLOR_08="#f7d75c"           #

COLOR_09="#874228"           #
COLOR_10="#ff4331"           # COMMAND_ERROR
COLOR_11="#b4b264"           # EXEC
COLOR_12="#ff9566"           #
COLOR_13="#9eb2b4"           # FOLDER
COLOR_14="#ff5b6a"           #
COLOR_15="#8acd8f"           #
COLOR_16="#ffe598"           #

BACKGROUND_COLOR="#120b0d"   # Background Color
FOREGROUND_COLOR="#f7d66a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Mona Lisa"
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