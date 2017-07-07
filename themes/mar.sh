#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b5407b"           # SYNTAX_STRING
COLOR_03="#7bb540"           # COMMAND
COLOR_04="#b57b40"           # COMMAND_COLOR2
COLOR_05="#407bb5"           # PATH
COLOR_06="#7b40b5"           # SYNTAX_VAR
COLOR_07="#40b57b"           # PROMP
COLOR_08="#f8f8f8"           #

COLOR_09="#737373"           #
COLOR_10="#cd73a0"           # COMMAND_ERROR
COLOR_11="#a0cd73"           # EXEC
COLOR_12="#cda073"           #
COLOR_13="#73a0cd"           # FOLDER
COLOR_14="#a073cd"           #
COLOR_15="#73cda0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#ffffff"   # Background Color
FOREGROUND_COLOR="#23476a"   # Text
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
