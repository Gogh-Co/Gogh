#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cc0000"           # SYNTAX_STRING
COLOR_03="#009600"           # COMMAND
COLOR_04="#d06b00"           # COMMAND_COLOR2
COLOR_05="#0000cc"           # PATH
COLOR_06="#cc00cc"           # SYNTAX_VAR
COLOR_07="#0087cc"           # PROMP
COLOR_08="#cccccc"           #

COLOR_09="#808080"           #
COLOR_10="#cc0000"           # COMMAND_ERROR
COLOR_11="#009600"           # EXEC
COLOR_12="#d06b00"           #
COLOR_13="#0000cc"           # FOLDER
COLOR_14="#cc00cc"           #
COLOR_15="#0087cc"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#dfdbc3"   # Background Color
FOREGROUND_COLOR="#3b2322"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Novel"
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
