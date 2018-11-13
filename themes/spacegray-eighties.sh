#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#15171c"           # HOST
COLOR_02="#ec5f67"           # SYNTAX_STRING
COLOR_03="#81a764"           # COMMAND
COLOR_04="#fec254"           # COMMAND_COLOR2
COLOR_05="#5486c0"           # PATH
COLOR_06="#bf83c1"           # SYNTAX_VAR
COLOR_07="#57c2c1"           # PROMP
COLOR_08="#efece7"           #

COLOR_09="#555555"           #
COLOR_10="#ff6973"           # COMMAND_ERROR
COLOR_11="#93d493"           # EXEC
COLOR_12="#ffd256"           #
COLOR_13="#4d84d1"           # FOLDER
COLOR_14="#ff55ff"           #
COLOR_15="#83e9e4"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#bdbaae"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="SpaceGray Eighties"
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