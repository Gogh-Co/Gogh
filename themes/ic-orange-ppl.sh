#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#c13900"           # SYNTAX_STRING
COLOR_03="#a4a900"           # COMMAND
COLOR_04="#caaf00"           # COMMAND_COLOR2
COLOR_05="#bd6d00"           # PATH
COLOR_06="#fc5e00"           # SYNTAX_VAR
COLOR_07="#f79500"           # PROMP
COLOR_08="#ffc88a"           #

COLOR_09="#6a4f2a"           #
COLOR_10="#ff8c68"           # COMMAND_ERROR
COLOR_11="#f6ff40"           # EXEC
COLOR_12="#ffe36e"           #
COLOR_13="#ffbe55"           # FOLDER
COLOR_14="#fc874f"           #
COLOR_15="#c69752"           #
COLOR_16="#fafaff"           #

BACKGROUND_COLOR="#262626"   # Background Color
FOREGROUND_COLOR="#ffcb83"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="IC Orange PPL"
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