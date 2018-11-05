#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#c70031"           # SYNTAX_STRING
COLOR_03="#29cf13"           # COMMAND
COLOR_04="#d8e30e"           # COMMAND_COLOR2
COLOR_05="#3449d1"           # PATH
COLOR_06="#8400ff"           # SYNTAX_VAR
COLOR_07="#0798ab"           # PROMP
COLOR_08="#e2d1e3"           #

COLOR_09="#5a5a5a"           #
COLOR_10="#f01578"           # COMMAND_ERROR
COLOR_11="#6ce05c"           # EXEC
COLOR_12="#f3f79e"           #
COLOR_13="#97a4f7"           # FOLDER
COLOR_14="#c495f0"           #
COLOR_15="#68f2e0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0e100a"   # Background Color
FOREGROUND_COLOR="#f7f7f7"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Kibble"
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
