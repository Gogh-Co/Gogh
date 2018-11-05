#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#f8282a"           # SYNTAX_STRING
COLOR_03="#328a5d"           # COMMAND
COLOR_04="#fa701d"           # COMMAND_COLOR2
COLOR_05="#135cd0"           # PATH
COLOR_06="#9f00bd"           # SYNTAX_VAR
COLOR_07="#33c3c1"           # PROMP
COLOR_08="#b3b3b3"           #

COLOR_09="#555753"           #
COLOR_10="#fb0416"           # COMMAND_ERROR
COLOR_11="#2cc631"           # EXEC
COLOR_12="#fdd727"           #
COLOR_13="#1670ff"           # FOLDER
COLOR_14="#e900b0"           #
COLOR_15="#3ad5ce"           #
COLOR_16="#eeeeec"           #

BACKGROUND_COLOR="#ffffff"   # Background Color
FOREGROUND_COLOR="#262626"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="CLRS"
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
