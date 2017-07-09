#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#323232"           # HOST
COLOR_02="#d25252"           # SYNTAX_STRING
COLOR_03="#7fe173"           # COMMAND
COLOR_04="#ffc66d"           # COMMAND_COLOR2
COLOR_05="#4099ff"           # PATH
COLOR_06="#f680ff"           # SYNTAX_VAR
COLOR_07="#bed6ff"           # PROMP
COLOR_08="#eeeeec"           #

COLOR_09="#535353"           #
COLOR_10="#f07070"           # COMMAND_ERROR
COLOR_11="#9dff91"           # EXEC
COLOR_12="#ffe48b"           #
COLOR_13="#5eb7f7"           # FOLDER
COLOR_14="#ff9dff"           #
COLOR_15="#dcf4ff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#323232"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Idle Toes"
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
