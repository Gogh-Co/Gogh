#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff4242"           # SYNTAX_STRING
COLOR_03="#74af68"           # COMMAND
COLOR_04="#ffad29"           # COMMAND_COLOR2
COLOR_05="#338f86"           # PATH
COLOR_06="#9414e6"           # SYNTAX_VAR
COLOR_07="#23d7d7"           # PROMP
COLOR_08="#e1e1e0"           #

COLOR_09="#555555"           #
COLOR_10="#ff3242"           # COMMAND_ERROR
COLOR_11="#74cd68"           # EXEC
COLOR_12="#ffb929"           #
COLOR_13="#23d7d7"           # FOLDER
COLOR_14="#ff37ff"           #
COLOR_15="#00ede1"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#2d3743"   # Background Color
FOREGROUND_COLOR="#e1e1e0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Misterioso"
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