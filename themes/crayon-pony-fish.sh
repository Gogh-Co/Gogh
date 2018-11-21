#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2b1b1d"           # HOST
COLOR_02="#91002b"           # SYNTAX_STRING
COLOR_03="#579524"           # COMMAND
COLOR_04="#ab311b"           # COMMAND_COLOR2
COLOR_05="#8c87b0"           # PATH
COLOR_06="#692f50"           # SYNTAX_VAR
COLOR_07="#e8a866"           # PROMP
COLOR_08="#68525a"           #

COLOR_09="#3d2b2e"           #
COLOR_10="#c5255d"           # COMMAND_ERROR
COLOR_11="#8dff57"           # EXEC
COLOR_12="#c8381d"           #
COLOR_13="#cfc9ff"           # FOLDER
COLOR_14="#fc6cba"           #
COLOR_15="#ffceaf"           #
COLOR_16="#b0949d"           #

BACKGROUND_COLOR="#150707"   # Background Color
FOREGROUND_COLOR="#68525a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Crayon Pony Fish"
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