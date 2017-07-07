#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#25292a"           # HOST
COLOR_02="#f24840"           # SYNTAX_STRING
COLOR_03="#629655"           # COMMAND
COLOR_04="#b68800"           # COMMAND_COLOR2
COLOR_05="#2075c7"           # PATH
COLOR_06="#797fd4"           # SYNTAX_VAR
COLOR_07="#15968d"           # PROMP
COLOR_08="#d2d8d9"           #

COLOR_09="#25292a"           #
COLOR_10="#f24840"           # COMMAND_ERROR
COLOR_11="#629655"           # EXEC
COLOR_12="#b68800"           #
COLOR_13="#2075c7"           # FOLDER
COLOR_14="#797fd4"           #
COLOR_15="#15968d"           #
COLOR_16="#d2d8d9"           #

BACKGROUND_COLOR="#3d3f41"   # Background Color
FOREGROUND_COLOR="#d2d8d9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Darcula"
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
