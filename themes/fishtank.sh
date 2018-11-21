#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#03073c"           # HOST
COLOR_02="#c6004a"           # SYNTAX_STRING
COLOR_03="#acf157"           # COMMAND
COLOR_04="#fecd5e"           # COMMAND_COLOR2
COLOR_05="#525fb8"           # PATH
COLOR_06="#986f82"           # SYNTAX_VAR
COLOR_07="#968763"           # PROMP
COLOR_08="#ecf0fc"           #

COLOR_09="#6c5b30"           #
COLOR_10="#da4b8a"           # COMMAND_ERROR
COLOR_11="#dbffa9"           # EXEC
COLOR_12="#fee6a9"           #
COLOR_13="#b2befa"           # FOLDER
COLOR_14="#fda5cd"           #
COLOR_15="#a5bd86"           #
COLOR_16="#f6ffec"           #

BACKGROUND_COLOR="#232537"   # Background Color
FOREGROUND_COLOR="#ecf0fe"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Fishtank"
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