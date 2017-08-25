#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff0000"           # SYNTAX_STRING
COLOR_03="#38de21"           # COMMAND
COLOR_04="#ffe50a"           # COMMAND_COLOR2
COLOR_05="#1460d2"           # PATH
COLOR_06="#ff005d"           # SYNTAX_VAR
COLOR_07="#00bbbb"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#555555"           #
COLOR_10="#f40e17"           # COMMAND_ERROR
COLOR_11="#3bd01d"           # EXEC
COLOR_12="#edc809"           #
COLOR_13="#5555ff"           # FOLDER
COLOR_14="#ff55ff"           #
COLOR_15="#6ae3fa"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#132738"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Cobalt2"
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
