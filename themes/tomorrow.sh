#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#C82828"
COLOR_03="#718C00"
COLOR_04="#EAB700"
COLOR_05="#4171AE"
COLOR_06="#8959A8"
COLOR_07="#3E999F"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#C82828"
COLOR_11="#708B00"
COLOR_12="#E9B600"
COLOR_13="#4170AE"
COLOR_14="#8958A7"
COLOR_15="#3D999F"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#FFFFFF"
FOREGROUND_COLOR="#4D4D4C"
CURSOR_COLOR="#4C4C4C"
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
