#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#303030"          # HOST
COLOR_02="#a87139"          # SYNTAX_STRING
COLOR_03="#39a871"          # COMMAND
COLOR_04="#71a839"          # COMMAND_COLOR2
COLOR_05="#7139a8"          # PATH
COLOR_06="#a83971"          # SYNTAX_VAR
COLOR_07="#3971a8"          # PROMP
COLOR_08="#8a8a8a"          #

COLOR_09="#494949"          #
COLOR_10="#b0763b"          # COMMAND_ERROR
COLOR_11="#3bb076"          # EXEC
COLOR_12="#76b03b"          #
COLOR_13="#763bb0"          # FOLDER
COLOR_14="#b03b76"          #
COLOR_15="#3b76b0"          #
COLOR_16="#cfcfcf"          #

BACKGROUND_COLOR="#191f1d"  # Background Color
FOREGROUND_COLOR="#d9e6f2"  # Text
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
