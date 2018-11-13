#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#050404"           # HOST
COLOR_02="#bd0013"           # SYNTAX_STRING
COLOR_03="#4ab118"           # COMMAND
COLOR_04="#e7741e"           # COMMAND_COLOR2
COLOR_05="#0f4ac6"           # PATH
COLOR_06="#665993"           # SYNTAX_VAR
COLOR_07="#70a598"           # PROMP
COLOR_08="#f8dcc0"           #

COLOR_09="#4e7cbf"           #
COLOR_10="#fc5f5a"           # COMMAND_ERROR
COLOR_11="#9eff6e"           # EXEC
COLOR_12="#efc11a"           #
COLOR_13="#1997c6"           # FOLDER
COLOR_14="#9b5953"           #
COLOR_15="#c8faf4"           #
COLOR_16="#f6f5fb"           #

BACKGROUND_COLOR="#1f1d45"   # Background Color
FOREGROUND_COLOR="#f8dcc0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Adventure Time"
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