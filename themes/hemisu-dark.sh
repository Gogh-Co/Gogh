#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#444444"
COLOR_02="#FF0054"
COLOR_03="#B1D630"
COLOR_04="#9D895E"
COLOR_05="#67BEE3"
COLOR_06="#B576BC"
COLOR_07="#569A9F"
COLOR_08="#EDEDED"

COLOR_09="#777777"
COLOR_10="#D65E75"
COLOR_11="#BAFFAA"
COLOR_12="#ECE1C8"
COLOR_13="#9FD3E5"
COLOR_14="#DEB3DF"
COLOR_15="#B6E0E5"
COLOR_16="#FFFFFF"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#FFFFFF"
CURSOR_COLOR="#BAFFAA"
PROFILE_NAME="Hemisu-dark"
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
