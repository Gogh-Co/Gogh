#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#E06C75"
COLOR_03="#98C379"
COLOR_04="#D19A66"
COLOR_05="#61AFEF"
COLOR_06="#C678DD"
COLOR_07="#56B6C2"
COLOR_08="#ABB2BF"

COLOR_09="#5C6370"
COLOR_10="#E06C75"
COLOR_11="#98C379"
COLOR_12="#D19A66"
COLOR_13="#61AFEF"
COLOR_14="#C678DD"
COLOR_15="#56B6C2"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#1E2127"
FOREGROUND_COLOR="#5C6370"
CURSOR_COLOR="#5C6370"
PROFILE_NAME="One-dark"
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
