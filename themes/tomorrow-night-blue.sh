#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#FF9DA3"
COLOR_03="#D1F1A9"
COLOR_04="#FFEEAD"
COLOR_05="#BBDAFF"
COLOR_06="#EBBBFF"
COLOR_07="#99FFFF"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#FF9CA3"
COLOR_11="#D0F0A8"
COLOR_12="#FFEDAC"
COLOR_13="#BADAFF"
COLOR_14="#EBBAFF"
COLOR_15="#99FFFF"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#002451"
FOREGROUND_COLOR="#FFFEFE"
CURSOR_COLOR="#FFFEFE"
PROFILE_NAME="Tomorrow-night-blue"
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
