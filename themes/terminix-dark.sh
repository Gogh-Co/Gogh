#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#282a2e"           # HOST
COLOR_02="#a54242"           # SYNTAX_STRING
COLOR_03="#a1b56c"           # COMMAND
COLOR_04="#de935f"           # COMMAND_COLOR2
COLOR_05="#225555"           # PATH
COLOR_06="#85678f"           # SYNTAX_VAR
COLOR_07="#5e8d87"           # PROMP
COLOR_08="#777777"           #

COLOR_09="#373b41"           #
COLOR_10="#c63535"           # COMMAND_ERROR
COLOR_11="#608360"           # EXEC
COLOR_12="#fa805a"           #
COLOR_13="#449da1"           # FOLDER
COLOR_14="#ba8baf"           #
COLOR_15="#86c1b9"           #
COLOR_16="#c5c8c6"           #

BACKGROUND_COLOR="#091116"   # Background Color
FOREGROUND_COLOR="#868A8C"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Terminix Dark"
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