#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#44475a"           # HOST
COLOR_02="#ff5555"           # SYNTAX_STRING
COLOR_03="#50fa7b"           # COMMAND
COLOR_04="#ffb86c"           # COMMAND_COLOR2
COLOR_05="#8be9fd"           # PATH
COLOR_06="#bd93f9"           # SYNTAX_VAR
COLOR_07="#ff79c6"           # PROMP
COLOR_08="#94A3A5"           #

COLOR_09="#000000"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#50fa7b"           # EXEC
COLOR_12="#ffb86c"           #
COLOR_13="#8be9fd"           # FOLDER
COLOR_14="#bd93f9"           #
COLOR_15="#ff79c6"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#282a36"   # Background Color
FOREGROUND_COLOR="#94A3A5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="_base"
# =============================================







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
