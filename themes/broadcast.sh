#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#da4939"           # SYNTAX_STRING
COLOR_03="#519f50"           # COMMAND
COLOR_04="#ffd24a"           # COMMAND_COLOR2
COLOR_05="#6d9cbe"           # PATH
COLOR_06="#d0d0ff"           # SYNTAX_VAR
COLOR_07="#6e9cbe"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#323232"           #
COLOR_10="#ff7b6b"           # COMMAND_ERROR
COLOR_11="#83d182"           # EXEC
COLOR_12="#ffff7c"           #
COLOR_13="#9fcef0"           # FOLDER
COLOR_14="#ffffff"           #
COLOR_15="#a0cef0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#2b2b2b"   # Background Color
FOREGROUND_COLOR="#e6e1dc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Broadcast"
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
