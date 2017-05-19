#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#F27779"
COLOR_03="#99CC99"
COLOR_04="#FFCC66"
COLOR_05="#6699CC"
COLOR_06="#CC99CC"
COLOR_07="#66CCCC"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#F17779"
COLOR_11="#99CC99"
COLOR_12="#FFCC66"
COLOR_13="#6699CC"
COLOR_14="#CC99CC"
COLOR_15="#66CCCC"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#2C2C2C"
FOREGROUND_COLOR="#CCCCCC"
CURSOR_COLOR="#CCCCCC"
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
