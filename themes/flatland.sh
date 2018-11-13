#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1d1d19"           # HOST
COLOR_02="#f18339"           # SYNTAX_STRING
COLOR_03="#9fd364"           # COMMAND
COLOR_04="#f4ef6d"           # COMMAND_COLOR2
COLOR_05="#5096be"           # PATH
COLOR_06="#695abc"           # SYNTAX_VAR
COLOR_07="#d63865"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#1d1d19"           #
COLOR_10="#d22a24"           # COMMAND_ERROR
COLOR_11="#a7d42c"           # EXEC
COLOR_12="#ff8949"           #
COLOR_13="#61b9d0"           # FOLDER
COLOR_14="#695abc"           #
COLOR_15="#d63865"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1d1f21"   # Background Color
FOREGROUND_COLOR="#b8dbef"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Flatland"
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