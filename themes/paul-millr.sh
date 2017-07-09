#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2a2a2a"           # HOST
COLOR_02="#ff0000"           # SYNTAX_STRING
COLOR_03="#79ff0f"           # COMMAND
COLOR_04="#d3bf00"           # COMMAND_COLOR2
COLOR_05="#396bd7"           # PATH
COLOR_06="#b449be"           # SYNTAX_VAR
COLOR_07="#66ccff"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#666666"           #
COLOR_10="#ff0080"           # COMMAND_ERROR
COLOR_11="#66ff66"           # EXEC
COLOR_12="#f3d64e"           #
COLOR_13="#709aed"           # FOLDER
COLOR_14="#db67e6"           #
COLOR_15="#7adff2"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#f2f2f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Paul Millr"
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
