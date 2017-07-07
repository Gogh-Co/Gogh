#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#DA3E39"
COLOR_03="#41933E"
COLOR_04="#855504"
COLOR_05="#315EEE"
COLOR_06="#930092"
COLOR_07="#0E6FAD"
COLOR_08="#8E8F96"

COLOR_09="#2A2B32"
COLOR_10="#DA3E39"
COLOR_11="#41933E"
COLOR_12="#855504"
COLOR_13="#315EEE"
COLOR_14="#930092"
COLOR_15="#0E6FAD"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#F8F8F8"
FOREGROUND_COLOR="#2A2B32"
CURSOR_COLOR="#2A2B32"
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
