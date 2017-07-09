#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cc0000"           # SYNTAX_STRING
COLOR_03="#1a921c"           # COMMAND
COLOR_04="#f0e53a"           # COMMAND_COLOR2
COLOR_05="#0066ff"           # PATH
COLOR_06="#c5656b"           # SYNTAX_VAR
COLOR_07="#06989a"           # PROMP
COLOR_08="#d3d7cf"           #

COLOR_09="#555753"           #
COLOR_10="#ef2929"           # COMMAND_ERROR
COLOR_11="#9aff87"           # EXEC
COLOR_12="#fffb5c"           #
COLOR_13="#43a8ed"           # FOLDER
COLOR_14="#ff818a"           #
COLOR_15="#34e2e2"           #
COLOR_16="#eeeeec"           #

BACKGROUND_COLOR="#2a211c"   # Background Color
FOREGROUND_COLOR="#b8a898"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Espresso Libre"
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
