#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#575757"           # HOST
COLOR_02="#ff1b00"           # SYNTAX_STRING
COLOR_03="#a5e055"           # COMMAND
COLOR_04="#fbe74a"           # COMMAND_COLOR2
COLOR_05="#496487"           # PATH
COLOR_06="#fd5ff1"           # SYNTAX_VAR
COLOR_07="#86e9fe"           # PROMP
COLOR_08="#cbcccb"           #

COLOR_09="#262626"           #
COLOR_10="#d51d00"           # COMMAND_ERROR
COLOR_11="#a5df55"           # EXEC
COLOR_12="#fbe84a"           #
COLOR_13="#89beff"           # FOLDER
COLOR_14="#c001c1"           #
COLOR_15="#86eafe"           #
COLOR_16="#dbdbdb"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#dbdbdb"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hurtado"
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

gogh_colors
if [ -e $PARENT_PATH"/apply-colors.sh" ]; then
    source $PARENT_PATH"/apply-colors.sh"
else
    source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
