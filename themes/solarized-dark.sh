#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073642"           # HOST
COLOR_02="#DC322F"           # SYNTAX_STRING
COLOR_03="#859900"           # COMMAND
COLOR_04="#CF9A6B"           # COMMAND_COLOR2
COLOR_05="#268BD2"           # PATH
COLOR_06="#D33682"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#EEE8D5"           #

COLOR_09="#657B83"           #
COLOR_10="#D87979"           # COMMAND_ERROR
COLOR_11="#88CF76"           # EXEC
COLOR_12="#657B83"           #
COLOR_13="#2699FF"           # FOLDER
COLOR_14="#D33682"           #
COLOR_15="#43B8C3"           #
COLOR_16="#FDF6E3"           #

BACKGROUND_COLOR="#002B36"   # Background Color
FOREGROUND_COLOR="#839496"   # Text
BOLD_COLOR="#93A1A1"         # Bold
PROFILE_NAME="Solarized-dark"
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
