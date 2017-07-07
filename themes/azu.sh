#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ac6d74"           # SYNTAX_STRING
COLOR_03="#74ac6d"           # COMMAND
COLOR_04="#aca46d"           # COMMAND_COLOR2
COLOR_05="#6d74ac"           # PATH
COLOR_06="#a46dac"           # SYNTAX_VAR
COLOR_07="#6daca4"           # PROMP
COLOR_08="#e6e6e6"           #

COLOR_09="#262626"           #
COLOR_10="#d6b8bc"           # COMMAND_ERROR
COLOR_11="#bcd6b8"           # EXEC
COLOR_12="#d6d3b8"           #
COLOR_13="#b8bcd6"           # FOLDER
COLOR_14="#d3b8d6"           #
COLOR_15="#b8d6d3"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#09111a"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
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
