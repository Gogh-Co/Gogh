#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#800000"           # SYNTAX_STRING
COLOR_03="#61ce3c"           # COMMAND
COLOR_04="#fbde2d"           # COMMAND_COLOR2
COLOR_05="#253b76"           # PATH
COLOR_06="#ff0080"           # SYNTAX_VAR
COLOR_07="#8da6ce"           # PROMP
COLOR_08="#f8f8f8"           #

COLOR_09="#000000"           #
COLOR_10="#800000"           # COMMAND_ERROR
COLOR_11="#61ce3c"           # EXEC
COLOR_12="#fbde2d"           #
COLOR_13="#253b76"           # FOLDER
COLOR_14="#ff0080"           #
COLOR_15="#8da6ce"           #
COLOR_16="#f8f8f8"           #

BACKGROUND_COLOR="#271f19"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Neopolitan"
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
