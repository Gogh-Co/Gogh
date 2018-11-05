#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#575757"           # HOST
COLOR_02="#ff1b00"           # SYNTAX_STRING
COLOR_03="#a5e055"           # COMMAND
COLOR_04="#fbe74a"           # COMMAND_COLOR2
COLOR_05="#496487"           # PATH
COLOR_06="#fd5ff1"           # SYNTAX_VAR
COLOR_07="#86e9fe"           # PROMP
COLOR_08="#cbcccb"           #

COLOR_09="#262626"           #
COLOR_10="#d51d00"           # COMMAND_ERROR
COLOR_11="#a5df55"           # EXEC
COLOR_12="#fbe84a"           #
COLOR_13="#89beff"           # FOLDER
COLOR_14="#c001c1"           #
COLOR_15="#86eafe"           #
COLOR_16="#dbdbdb"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#dbdbdb"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hurtado"
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
