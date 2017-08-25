#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#383838"           # HOST
COLOR_02="#a95551"           # SYNTAX_STRING
COLOR_03="#666666"           # COMMAND
COLOR_04="#a98051"           # COMMAND_COLOR2
COLOR_05="#657d3e"           # PATH
COLOR_06="#767676"           # SYNTAX_VAR
COLOR_07="#c9c9c9"           # PROMP
COLOR_08="#d0b8a3"           #

COLOR_09="#474747"           #
COLOR_10="#a97775"           # COMMAND_ERROR
COLOR_11="#8c8c8c"           # EXEC
COLOR_12="#a99175"           #
COLOR_13="#98bd5e"           # FOLDER
COLOR_14="#a3a3a3"           #
COLOR_15="#dcdcdc"           #
COLOR_16="#d8c8bb"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#a0a0a0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="N0tch2k"
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
