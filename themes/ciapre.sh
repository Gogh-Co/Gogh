#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#181818"           # HOST
COLOR_02="#810009"           # SYNTAX_STRING
COLOR_03="#48513b"           # COMMAND
COLOR_04="#cc8b3f"           # COMMAND_COLOR2
COLOR_05="#576d8c"           # PATH
COLOR_06="#724d7c"           # SYNTAX_VAR
COLOR_07="#5c4f4b"           # PROMP
COLOR_08="#aea47f"           #

COLOR_09="#555555"           #
COLOR_10="#ac3835"           # COMMAND_ERROR
COLOR_11="#a6a75d"           # EXEC
COLOR_12="#dcdf7c"           #
COLOR_13="#3097c6"           # FOLDER
COLOR_14="#d33061"           #
COLOR_15="#f3dbb2"           #
COLOR_16="#f4f4f4"           #

BACKGROUND_COLOR="#191c27"   # Background Color
FOREGROUND_COLOR="#aea47a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Ciapre"
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
