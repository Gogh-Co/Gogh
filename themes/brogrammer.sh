#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1f1f1f"           # HOST
COLOR_02="#f81118"           # SYNTAX_STRING
COLOR_03="#2dc55e"           # COMMAND
COLOR_04="#ecba0f"           # COMMAND_COLOR2
COLOR_05="#2a84d2"           # PATH
COLOR_06="#4e5ab7"           # SYNTAX_VAR
COLOR_07="#1081d6"           # PROMP
COLOR_08="#d6dbe5"           #

COLOR_09="#d6dbe5"           #
COLOR_10="#de352e"           # COMMAND_ERROR
COLOR_11="#1dd361"           # EXEC
COLOR_12="#f3bd09"           #
COLOR_13="#1081d6"           # FOLDER
COLOR_14="#5350b9"           #
COLOR_15="#0f7ddb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#131313"   # Background Color
FOREGROUND_COLOR="#d6dbe5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Brogrammer"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
    echo ""
}

function curlsource() {
    f=$(mktemp -t curlsource)
    curl -o "$f" -s -L "$1"
    source "$f"
    rm -f "$f"
}

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

gogh_colors
if [ -e $PARENT_PATH"/apply-colors.sh" ]; then
    source $PARENT_PATH"/apply-colors.sh"
else
        if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
