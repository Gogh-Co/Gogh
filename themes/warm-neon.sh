#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#e24346"           # SYNTAX_STRING
COLOR_03="#39b13a"           # COMMAND
COLOR_04="#dae145"           # COMMAND_COLOR2
COLOR_05="#4261c5"           # PATH
COLOR_06="#f920fb"           # SYNTAX_VAR
COLOR_07="#2abbd4"           # PROMP
COLOR_08="#d0b8a3"           #

COLOR_09="#fefcfc"           #
COLOR_10="#e97071"           # COMMAND_ERROR
COLOR_11="#9cc090"           # EXEC
COLOR_12="#ddda7a"           #
COLOR_13="#7b91d6"           # FOLDER
COLOR_14="#f674ba"           #
COLOR_15="#5ed1e5"           #
COLOR_16="#d8c8bb"           #

BACKGROUND_COLOR="#404040"   # Background Color
FOREGROUND_COLOR="#afdab6"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Warm Neon"
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