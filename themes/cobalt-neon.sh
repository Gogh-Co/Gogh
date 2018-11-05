#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#142631"           # HOST
COLOR_02="#ff2320"           # SYNTAX_STRING
COLOR_03="#3ba5ff"           # COMMAND
COLOR_04="#e9e75c"           # COMMAND_COLOR2
COLOR_05="#8ff586"           # PATH
COLOR_06="#781aa0"           # SYNTAX_VAR
COLOR_07="#8ff586"           # PROMP
COLOR_08="#ba46b2"           #

COLOR_09="#fff688"           #
COLOR_10="#d4312e"           # COMMAND_ERROR
COLOR_11="#8ff586"           # EXEC
COLOR_12="#e9f06d"           #
COLOR_13="#3c7dd2"           # FOLDER
COLOR_14="#8230a7"           #
COLOR_15="#6cbc67"           #
COLOR_16="#8ff586"           #

BACKGROUND_COLOR="#142838"   # Background Color
FOREGROUND_COLOR="#8ff586"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Cobalt Neon"
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
