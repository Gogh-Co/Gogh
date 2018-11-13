#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#15171c"           # HOST
COLOR_02="#b24a56"           # SYNTAX_STRING
COLOR_03="#92b477"           # COMMAND
COLOR_04="#c6735a"           # COMMAND_COLOR2
COLOR_05="#7c8fa5"           # PATH
COLOR_06="#a5789e"           # SYNTAX_VAR
COLOR_07="#80cdcb"           # PROMP
COLOR_08="#b3b8c3"           #

COLOR_09="#555555"           #
COLOR_10="#ec5f67"           # COMMAND_ERROR
COLOR_11="#89e986"           # EXEC
COLOR_12="#fec254"           #
COLOR_13="#5486c0"           # FOLDER
COLOR_14="#bf83c1"           #
COLOR_15="#58c2c1"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#c9c6bc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="SpaceGray Eighties Dull"
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