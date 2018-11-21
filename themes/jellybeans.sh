#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#929292"           # HOST
COLOR_02="#e27373"           # SYNTAX_STRING
COLOR_03="#94b979"           # COMMAND
COLOR_04="#ffba7b"           # COMMAND_COLOR2
COLOR_05="#97bedc"           # PATH
COLOR_06="#e1c0fa"           # SYNTAX_VAR
COLOR_07="#00988e"           # PROMP
COLOR_08="#dedede"           #

COLOR_09="#bdbdbd"           #
COLOR_10="#ffa1a1"           # COMMAND_ERROR
COLOR_11="#bddeab"           # EXEC
COLOR_12="#ffdca0"           #
COLOR_13="#b1d8f6"           # FOLDER
COLOR_14="#fbdaff"           #
COLOR_15="#1ab2a8"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#121212"   # Background Color
FOREGROUND_COLOR="#dedede"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Jellybeans"
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