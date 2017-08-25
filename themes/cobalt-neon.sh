#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#142631"           # HOST
COLOR_02="#ff2320"           # SYNTAX_STRING
COLOR_03="#3ba5ff"           # COMMAND
COLOR_04="#e9e75c"           # COMMAND_COLOR2
COLOR_05="#8ff586"           # PATH
COLOR_06="#781aa0"           # SYNTAX_VAR
COLOR_07="#8ff586"           # PROMP
COLOR_08="#ba46b2"           #

COLOR_09="#fff688"           #
COLOR_10="#d4312e"           # COMMAND_ERROR
COLOR_11="#8ff586"           # EXEC
COLOR_12="#e9f06d"           #
COLOR_13="#3c7dd2"           # FOLDER
COLOR_14="#8230a7"           #
COLOR_15="#6cbc67"           #
COLOR_16="#8ff586"           #

BACKGROUND_COLOR="#142838"   # Background Color
FOREGROUND_COLOR="#8ff586"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Cobalt Neon"
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
