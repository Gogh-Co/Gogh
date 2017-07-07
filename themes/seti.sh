#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#323232"           # HOST
COLOR_02="#c22832"           # SYNTAX_STRING
COLOR_03="#8ec43d"           # COMMAND
COLOR_04="#e0c64f"           # COMMAND_COLOR2
COLOR_05="#43a5d5"           # PATH
COLOR_06="#8b57b5"           # SYNTAX_VAR
COLOR_07="#8ec43d"           # PROMP
COLOR_08="#eeeeee"           #

COLOR_09="#323232"           #
COLOR_10="#c22832"           # COMMAND_ERROR
COLOR_11="#8ec43d"           # EXEC
COLOR_12="#e0c64f"           #
COLOR_13="#43a5d5"           # FOLDER
COLOR_14="#8b57b5"           #
COLOR_15="#8ec43d"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#111213"   # Background Color
FOREGROUND_COLOR="#cacecd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Seti"
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
