#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#dc322f"           # SYNTAX_STRING
COLOR_03="#56db3a"           # COMMAND
COLOR_04="#ff8400"           # COMMAND_COLOR2
COLOR_05="#0084d4"           # PATH
COLOR_06="#b729d9"           # SYNTAX_VAR
COLOR_07="#ccccff"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#1b1d21"           #
COLOR_10="#dc322f"           # COMMAND_ERROR
COLOR_11="#56db3a"           # EXEC
COLOR_12="#ff8400"           #
COLOR_13="#0084d4"           # FOLDER
COLOR_14="#b729d9"           #
COLOR_15="#ccccff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Symphonic"
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
