#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#f8282a"           # SYNTAX_STRING
COLOR_03="#328a5d"           # COMMAND
COLOR_04="#fa701d"           # COMMAND_COLOR2
COLOR_05="#135cd0"           # PATH
COLOR_06="#9f00bd"           # SYNTAX_VAR
COLOR_07="#33c3c1"           # PROMP
COLOR_08="#b3b3b3"           #

COLOR_09="#555753"           #
COLOR_10="#fb0416"           # COMMAND_ERROR
COLOR_11="#2cc631"           # EXEC
COLOR_12="#fdd727"           #
COLOR_13="#1670ff"           # FOLDER
COLOR_14="#e900b0"           #
COLOR_15="#3ad5ce"           #
COLOR_16="#eeeeec"           #

BACKGROUND_COLOR="#ffffff"   # Background Color
FOREGROUND_COLOR="#262626"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="CLRS"
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
