#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#c70031"           # SYNTAX_STRING
COLOR_03="#29cf13"           # COMMAND
COLOR_04="#d8e30e"           # COMMAND_COLOR2
COLOR_05="#3449d1"           # PATH
COLOR_06="#8400ff"           # SYNTAX_VAR
COLOR_07="#0798ab"           # PROMP
COLOR_08="#e2d1e3"           #

COLOR_09="#5a5a5a"           #
COLOR_10="#f01578"           # COMMAND_ERROR
COLOR_11="#6ce05c"           # EXEC
COLOR_12="#f3f79e"           #
COLOR_13="#97a4f7"           # FOLDER
COLOR_14="#c495f0"           #
COLOR_15="#68f2e0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0e100a"   # Background Color
FOREGROUND_COLOR="#f7f7f7"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Kibble"
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
