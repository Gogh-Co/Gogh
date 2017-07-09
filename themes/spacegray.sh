#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b04b57"           # SYNTAX_STRING
COLOR_03="#87b379"           # COMMAND
COLOR_04="#e5c179"           # COMMAND_COLOR2
COLOR_05="#7d8fa4"           # PATH
COLOR_06="#a47996"           # SYNTAX_VAR
COLOR_07="#85a7a5"           # PROMP
COLOR_08="#b3b8c3"           #

COLOR_09="#000000"           #
COLOR_10="#b04b57"           # COMMAND_ERROR
COLOR_11="#87b379"           # EXEC
COLOR_12="#e5c179"           #
COLOR_13="#7d8fa4"           # FOLDER
COLOR_14="#a47996"           #
COLOR_15="#85a7a5"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#20242d"   # Background Color
FOREGROUND_COLOR="#b3b8c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="SpaceGray"
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
