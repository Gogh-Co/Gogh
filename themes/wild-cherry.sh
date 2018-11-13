#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000507"           # HOST
COLOR_02="#d94085"           # SYNTAX_STRING
COLOR_03="#2ab250"           # COMMAND
COLOR_04="#ffd16f"           # COMMAND_COLOR2
COLOR_05="#883cdc"           # PATH
COLOR_06="#ececec"           # SYNTAX_VAR
COLOR_07="#c1b8b7"           # PROMP
COLOR_08="#fff8de"           #

COLOR_09="#009cc9"           #
COLOR_10="#da6bac"           # COMMAND_ERROR
COLOR_11="#f4dca5"           # EXEC
COLOR_12="#eac066"           #
COLOR_13="#308cba"           # FOLDER
COLOR_14="#ae636b"           #
COLOR_15="#ff919d"           #
COLOR_16="#e4838d"           #

BACKGROUND_COLOR="#1f1726"   # Background Color
FOREGROUND_COLOR="#dafaff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Wild Cherry"
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