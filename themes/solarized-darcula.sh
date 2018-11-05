#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#25292a"           # HOST
COLOR_02="#f24840"           # SYNTAX_STRING
COLOR_03="#629655"           # COMMAND
COLOR_04="#b68800"           # COMMAND_COLOR2
COLOR_05="#2075c7"           # PATH
COLOR_06="#797fd4"           # SYNTAX_VAR
COLOR_07="#15968d"           # PROMP
COLOR_08="#d2d8d9"           #

COLOR_09="#25292a"           #
COLOR_10="#f24840"           # COMMAND_ERROR
COLOR_11="#629655"           # EXEC
COLOR_12="#b68800"           #
COLOR_13="#2075c7"           # FOLDER
COLOR_14="#797fd4"           #
COLOR_15="#15968d"           #
COLOR_16="#d2d8d9"           #

BACKGROUND_COLOR="#3d3f41"   # Background Color
FOREGROUND_COLOR="#d2d8d9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Darcula"
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
