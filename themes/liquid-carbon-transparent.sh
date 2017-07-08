#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff3030"           # SYNTAX_STRING
COLOR_03="#559a70"           # COMMAND
COLOR_04="#ccac00"           # COMMAND_COLOR2
COLOR_05="#0099cc"           # PATH
COLOR_06="#cc69c8"           # SYNTAX_VAR
COLOR_07="#7ac4cc"           # PROMP
COLOR_08="#bccccc"           #

COLOR_09="#000000"           #
COLOR_10="#ff3030"           # COMMAND_ERROR
COLOR_11="#559a70"           # EXEC
COLOR_12="#ccac00"           #
COLOR_13="#0099cc"           # FOLDER
COLOR_14="#cc69c8"           #
COLOR_15="#7ac4cc"           #
COLOR_16="#bccccc"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#afc2c2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Liquid Carbon Transparent"
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
