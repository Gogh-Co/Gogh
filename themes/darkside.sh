#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#e8341c"           # SYNTAX_STRING
COLOR_03="#68c256"           # COMMAND
COLOR_04="#f2d42c"           # COMMAND_COLOR2
COLOR_05="#1c98e8"           # PATH
COLOR_06="#8e69c9"           # SYNTAX_VAR
COLOR_07="#1c98e8"           # PROMP
COLOR_08="#bababa"           #

COLOR_09="#000000"           #
COLOR_10="#e05a4f"           # COMMAND_ERROR
COLOR_11="#77b869"           # EXEC
COLOR_12="#efd64b"           #
COLOR_13="#387cd3"           # FOLDER
COLOR_14="#957bbe"           #
COLOR_15="#3d97e2"           #
COLOR_16="#bababa"           #

BACKGROUND_COLOR="#222324"   # Background Color
FOREGROUND_COLOR="#bababa"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Darkside"
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
