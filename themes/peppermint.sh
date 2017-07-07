#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535"
COLOR_02="#E64569"
COLOR_03="#89D287"
COLOR_04="#DAB752"
COLOR_05="#439ECF"
COLOR_06="#D961DC"
COLOR_07="#64AAAF"
COLOR_08="#B3B3B3"

COLOR_09="#535353"
COLOR_10="#E4859A"
COLOR_11="#A2CCA1"
COLOR_12="#E1E387"
COLOR_13="#6FBBE2"
COLOR_14="#E586E7"
COLOR_15="#96DCDA"
COLOR_16="#DEDEDE"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#C7C7C7"
CURSOR_COLOR="#BBBBBB"
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
