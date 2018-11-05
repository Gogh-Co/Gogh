#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#757575"           # HOST
COLOR_02="#825d4d"           # SYNTAX_STRING
COLOR_03="#728c62"           # COMMAND
COLOR_04="#ada16d"           # COMMAND_COLOR2
COLOR_05="#4d7b82"           # PATH
COLOR_06="#8a7267"           # SYNTAX_VAR
COLOR_07="#729494"           # PROMP
COLOR_08="#e0e0e0"           #

COLOR_09="#8a8a8a"           #
COLOR_10="#cf937a"           # COMMAND_ERROR
COLOR_11="#98d9aa"           # EXEC
COLOR_12="#fae79d"           #
COLOR_13="#7ac3cf"           # FOLDER
COLOR_14="#d6b2a1"           #
COLOR_15="#ade0e0"           #
COLOR_16="#e0e0e0"           #

BACKGROUND_COLOR="#243435"   # Background Color
FOREGROUND_COLOR="#d4e7d4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Seafoam Pastel"
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
