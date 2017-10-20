#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#121212"           # HOST
COLOR_02="#7325FA"           # SYNTAX_STRING
COLOR_03="#23E298"           # COMMAND
COLOR_04="#60D4DF"           # COMMAND_COLOR2
COLOR_05="#D08010"           # PATH
COLOR_06="#FF0087"           # SYNTAX_VAR
COLOR_07="#D0A843"           # PROMP
COLOR_08="#BBBBBB"           #

COLOR_09="#555555"           #
COLOR_10="#9D66F6"           # COMMAND_ERROR
COLOR_11="#5FE0B1"           # EXEC
COLOR_12="#6DF2FF"           #
COLOR_13="#FFAF00"           # FOLDER
COLOR_14="#FF87AF"           #
COLOR_15="#FFCE51"           #
COLOR_16="#FFFFFF"           #

BACKGROUND_COLOR="#121212"   # Background Color
FOREGROUND_COLOR="#BBBBBB"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Molokai"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
    echo ""
}

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

gogh_colors
if [ -e $PARENT_PATH"/apply-colors.sh" ]; then
    source $PARENT_PATH"/apply-colors.sh"
else
    source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
