#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#222222"           # HOST
COLOR_02="#e2a8bf"           # SYNTAX_STRING
COLOR_03="#81d778"           # COMMAND
COLOR_04="#c4c9c0"           # COMMAND_COLOR2
COLOR_05="#264b49"           # PATH
COLOR_06="#a481d3"           # SYNTAX_VAR
COLOR_07="#15ab9c"           # PROMP
COLOR_08="#02c5e0"           #

COLOR_09="#ffffff"           #
COLOR_10="#ffcdd9"           # COMMAND_ERROR
COLOR_11="#beffa8"           # EXEC
COLOR_12="#d0ccca"           #
COLOR_13="#7ab0d2"           # FOLDER
COLOR_14="#c5a7d9"           #
COLOR_15="#8cdfe0"           #
COLOR_16="#e0e0e0"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#35b1d2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Slate"
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
