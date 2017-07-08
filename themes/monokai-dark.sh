#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#75715e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#a6e22e"           # COMMAND
COLOR_04="#f4bf75"           # COMMAND_COLOR2
COLOR_05="#66d9ef"           # PATH
COLOR_06="#ae81ff"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#f9f8f5"           #

COLOR_09="#272822"           #
COLOR_10="#f92672"           # COMMAND_ERROR
COLOR_11="#a6e22e"           # EXEC
COLOR_12="#f4bf75"           #
COLOR_13="#66d9ef"           # FOLDER
COLOR_14="#ae81ff"           #
COLOR_15="#2AA198"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#272822"   # Background Color
FOREGROUND_COLOR="#f8f8f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Monokai-dark"
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
