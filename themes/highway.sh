#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d00e18"           # SYNTAX_STRING
COLOR_03="#138034"           # COMMAND
COLOR_04="#ffcb3e"           # COMMAND_COLOR2
COLOR_05="#006bb3"           # PATH
COLOR_06="#6b2775"           # SYNTAX_VAR
COLOR_07="#384564"           # PROMP
COLOR_08="#ededed"           #

COLOR_09="#5d504a"           #
COLOR_10="#f07e18"           # COMMAND_ERROR
COLOR_11="#b1d130"           # EXEC
COLOR_12="#fff120"           #
COLOR_13="#4fc2fd"           # FOLDER
COLOR_14="#de0071"           #
COLOR_15="#5d504a"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#222225"   # Background Color
FOREGROUND_COLOR="#ededed"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Highway"
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
