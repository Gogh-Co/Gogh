#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073641"
COLOR_02="#EB606B"
COLOR_03="#C3E88D"
COLOR_04="#F7EB95"
COLOR_05="#80CBC3"
COLOR_06="#FF2490"
COLOR_07="#AEDDFF"
COLOR_08="#FFFFFF"

COLOR_09="#002B36"
COLOR_10="#EB606B"
COLOR_11="#C3E88D"
COLOR_12="#F7EB95"
COLOR_13="#7DC6BF"
COLOR_14="#6C71C3"
COLOR_15="#34434D"
COLOR_16="#FFFFFF"

BACKGROUND_COLOR="#1E282C"
FOREGROUND_COLOR="#C3C7D1"
CURSOR_COLOR="#657B83"
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
