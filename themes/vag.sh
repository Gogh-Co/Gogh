#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#303030"          # HOST
COLOR_02="#a87139"          # SYNTAX_STRING
COLOR_03="#39a871"          # COMMAND
COLOR_04="#71a839"          # COMMAND_COLOR2
COLOR_05="#7139a8"          # PATH
COLOR_06="#a83971"          # SYNTAX_VAR
COLOR_07="#3971a8"          # PROMP
COLOR_08="#8a8a8a"          #

COLOR_09="#494949"          #
COLOR_10="#b0763b"          # COMMAND_ERROR
COLOR_11="#3bb076"          # EXEC
COLOR_12="#76b03b"          #
COLOR_13="#763bb0"          # FOLDER
COLOR_14="#b03b76"          #
COLOR_15="#3b76b0"          #
COLOR_16="#cfcfcf"          #

BACKGROUND_COLOR="#191f1d"  # Background Color
FOREGROUND_COLOR="#d9e6f2"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Vag"
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
