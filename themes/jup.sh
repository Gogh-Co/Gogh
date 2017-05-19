#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#dd006f"           # SYNTAX_STRING
COLOR_03="#6fdd00"           # COMMAND
COLOR_04="#dd6f00"           # COMMAND_COLOR2
COLOR_05="#006fdd"           # PATH
COLOR_06="#6f00dd"           # SYNTAX_VAR
COLOR_07="#00dd6f"           # PROMP
COLOR_08="#f2f2f2"           #

COLOR_09="#7d7d7d"           #
COLOR_10="#ff74b9"           # COMMAND_ERROR
COLOR_11="#b9ff74"           # EXEC
COLOR_12="#ffb974"           #
COLOR_13="#74b9ff"           # FOLDER
COLOR_14="#b974ff"           #
COLOR_15="#74ffb9"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#758480"   # Background Color
FOREGROUND_COLOR="#23476a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =====================  END CONFIG   ======================================= #







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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
