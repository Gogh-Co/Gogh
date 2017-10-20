#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#333333"           # HOST
COLOR_02="#8c4665"           # SYNTAX_STRING
COLOR_03="#287373"           # COMMAND
COLOR_04="#7c7c99"           # COMMAND_COLOR2
COLOR_05="#395573"           # PATH
COLOR_06="#5e468c"           # SYNTAX_VAR
COLOR_07="#31658c"           # PROMP
COLOR_08="#899ca1"           #

COLOR_09="#3d3d3d"           #
COLOR_10="#bf4d80"           # COMMAND_ERROR
COLOR_11="#53a6a6"           # EXEC
COLOR_12="#9e9ecb"           #
COLOR_13="#477ab3"           # FOLDER
COLOR_14="#7e62b3"           #
COLOR_15="#6096bf"           #
COLOR_16="#c0c0c0"           #

BACKGROUND_COLOR="#101010"   # Background Color
FOREGROUND_COLOR="#999993"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Wryan"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
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
