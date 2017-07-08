#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#012026"           # HOST
COLOR_02="#b2302d"           # SYNTAX_STRING
COLOR_03="#00a941"           # COMMAND
COLOR_04="#5e8baa"           # COMMAND_COLOR2
COLOR_05="#449a86"           # PATH
COLOR_06="#00599d"           # SYNTAX_VAR
COLOR_07="#5d7e19"           # PROMP
COLOR_08="#405555"           #

COLOR_09="#384451"           #
COLOR_10="#ff4242"           # COMMAND_ERROR
COLOR_11="#2aea5e"           # EXEC
COLOR_12="#8ed4fd"           #
COLOR_13="#61d5ba"           # FOLDER
COLOR_14="#1298ff"           #
COLOR_15="#98d028"           #
COLOR_16="#58fbd6"           #

BACKGROUND_COLOR="#001015"   # Background Color
FOREGROUND_COLOR="#405555"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Shaman"
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
