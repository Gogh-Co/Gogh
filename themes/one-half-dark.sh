#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#282c34"           # HOST
COLOR_02="#e06c75"           # SYNTAX_STRING
COLOR_03="#98c379"           # COMMAND
COLOR_04="#e5c07b"           # COMMAND_COLOR2
COLOR_05="#61afef"           # PATH
COLOR_06="#c678dd"           # SYNTAX_VAR
COLOR_07="#56b6c2"           # PROMP
COLOR_08="#dcdfe4"           #

COLOR_09="#282c34"           #
COLOR_10="#e06c75"           # COMMAND_ERROR
COLOR_11="#98c379"           # EXEC
COLOR_12="#e5c07b"           #
COLOR_13="#61afef"           # FOLDER
COLOR_14="#c678dd"           #
COLOR_15="#56b6c2"           #
COLOR_16="#dcdfe4"           #

BACKGROUND_COLOR="#282c34"   # Background Color
FOREGROUND_COLOR="#dcdfe4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="One Half Dark"
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
