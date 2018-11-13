#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#321300"           # HOST
COLOR_02="#b2270e"           # SYNTAX_STRING
COLOR_03="#44a900"           # COMMAND
COLOR_04="#aa820c"           # COMMAND_COLOR2
COLOR_05="#58859a"           # PATH
COLOR_06="#97363d"           # SYNTAX_VAR
COLOR_07="#b25a1e"           # PROMP
COLOR_08="#786b53"           #

COLOR_09="#433626"           #
COLOR_10="#ed5d20"           # COMMAND_ERROR
COLOR_11="#55f238"           # EXEC
COLOR_12="#f2b732"           #
COLOR_13="#85cfed"           # FOLDER
COLOR_14="#e14c5a"           #
COLOR_15="#f07d14"           #
COLOR_16="#ffc800"           #

BACKGROUND_COLOR="#191919"   # Background Color
FOREGROUND_COLOR="#786b53"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Treehouse"
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