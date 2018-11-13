#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#8d534e"          # SYNTAX_STRING
COLOR_03="#4e8d53"          # COMMAND
COLOR_04="#888d4e"          # COMMAND_COLOR2
COLOR_05="#534e8d"          # PATH
COLOR_06="#8d4e88"          # SYNTAX_VAR
COLOR_07="#4e888d"          # PROMP
COLOR_08="#ffffff"          #

COLOR_09="#000000"          #
COLOR_10="#b57d78"          # COMMAND_ERROR
COLOR_11="#78b57d"          # EXEC
COLOR_12="#b0b578"          #
COLOR_13="#7d78b5"          # FOLDER
COLOR_14="#b578b0"          #
COLOR_15="#78b0b5"          #
COLOR_16="#ffffff"          #

BACKGROUND_COLOR="#2e2e35"  # Background Color
FOREGROUND_COLOR="#ffffff"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Tin"
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