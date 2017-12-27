#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#573d26"           # HOST
COLOR_02="#be2d26"           # SYNTAX_STRING
COLOR_03="#6ba18a"           # COMMAND
COLOR_04="#e99d2a"           # COMMAND_COLOR2
COLOR_05="#5a86ad"           # PATH
COLOR_06="#ac80a6"           # SYNTAX_VAR
COLOR_07="#74a6ad"           # PROMP
COLOR_08="#e0dbb7"           #

COLOR_09="#9b6c4a"           #
COLOR_10="#e84627"           # COMMAND_ERROR
COLOR_11="#95d8ba"           # EXEC
COLOR_12="#d0d150"           #
COLOR_13="#b8d3ed"           # FOLDER
COLOR_14="#d19ecb"           #
COLOR_15="#93cfd7"           #
COLOR_16="#fff9d5"           #

BACKGROUND_COLOR="#2a1f1d"   # Background Color
FOREGROUND_COLOR="#e0dbb7"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Birds Of Paradise"
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
