#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2f1e2e"           # HOST
COLOR_02="#ef6155"           # SYNTAX_STRING
COLOR_03="#48b685"           # COMMAND
COLOR_04="#fec418"           # COMMAND_COLOR2
COLOR_05="#06b6ef"           # PATH
COLOR_06="#815ba4"           # SYNTAX_VAR
COLOR_07="#5bc4bf"           # PROMP
COLOR_08="#a39e9b"           #

COLOR_09="#776e71"           #
COLOR_10="#ef6155"           # COMMAND_ERROR
COLOR_11="#48b685"           # EXEC
COLOR_12="#fec418"           #
COLOR_13="#06b6ef"           # FOLDER
COLOR_14="#815ba4"           #
COLOR_15="#5bc4bf"           #
COLOR_16="#e7e9db"           #

BACKGROUND_COLOR="#2f1e2e"   # Background Color
FOREGROUND_COLOR="#a39e9b"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Paraiso Dark"
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
