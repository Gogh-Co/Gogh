#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4e4e4e"           # HOST
COLOR_02="#ff6c60"           # SYNTAX_STRING
COLOR_03="#a8ff60"           # COMMAND
COLOR_04="#ffffb6"           # COMMAND_COLOR2
COLOR_05="#69cbfe"           # PATH
COLOR_06="#ff73Fd"           # SYNTAX_VAR
COLOR_07="#c6c5fe"           # PROMP
COLOR_08="#eeeeee"           #

COLOR_09="#7c7c7c"           #
COLOR_10="#ffb6b0"           # COMMAND_ERROR
COLOR_11="#ceffac"           # EXEC
COLOR_12="#ffffcb"           #
COLOR_13="#b5dcfe"           # FOLDER
COLOR_14="#ff9cfe"           #
COLOR_15="#dfdffe"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#eeeeee"   # Text
CURSOR_COLOR="ffa560"        # Cursor
PROFILE_NAME="Ir Black"
# =============================================







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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
    if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
