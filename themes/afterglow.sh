#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#151515"           # HOST
COLOR_02="#a53c23"           # SYNTAX_STRING
COLOR_03="#7b9246"           # COMMAND
COLOR_04="#d3a04d"           # COMMAND_COLOR2
COLOR_05="#6c99bb"           # PATH
COLOR_06="#9f4e85"           # SYNTAX_VAR
COLOR_07="#7dd6cf"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#505050"           #
COLOR_10="#a53c23"           # COMMAND_ERROR
COLOR_11="#7b9246"           # EXEC
COLOR_12="#d3a04d"           #
COLOR_13="#547c99"           # FOLDER
COLOR_14="#9f4e85"           #
COLOR_15="#7dd6cf"           #
COLOR_16="#f5f5f5"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Afterglow"
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