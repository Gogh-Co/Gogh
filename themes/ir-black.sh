#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4e4e4e"           # HOST
COLOR_02="#ff6c60"           # SYNTAX_STRING
COLOR_03="#a8ff60"           # COMMAND
COLOR_04="#ffffb6"           # COMMAND_COLOR2
COLOR_05="#69cbfe"           # PATH
COLOR_06="#ff73Fd"           # SYNTAX_VAR
COLOR_07="#c6c5fe"           # PROMP
COLOR_08="#eeeeee"           #

COLOR_09="#7c7c7c"           #
COLOR_10="#ffb6b0"           # COMMAND_ERROR
COLOR_11="#ceffac"           # EXEC
COLOR_12="#ffffcb"           #
COLOR_13="#b5dcfe"           # FOLDER
COLOR_14="#ff9cfe"           #
COLOR_15="#dfdffe"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#eeeeee"   # Text
CURSOR_COLOR="ffa560"        # Cursor
PROFILE_NAME="Ir-black"
# =============================================







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
