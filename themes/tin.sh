#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#8d534e"          # SYNTAX_STRING
COLOR_03="#4e8d53"          # COMMAND
COLOR_04="#888d4e"          # COMMAND_COLOR2
COLOR_05="#534e8d"          # PATH
COLOR_06="#8d4e88"          # SYNTAX_VAR
COLOR_07="#4e888d"          # PROMP
COLOR_08="#ffffff"          #

COLOR_09="#000000"          #
COLOR_10="#b57d78"          # COMMAND_ERROR
COLOR_11="#78b57d"          # EXEC
COLOR_12="#b0b578"          #
COLOR_13="#7d78b5"          # FOLDER
COLOR_14="#b578b0"          #
COLOR_15="#78b0b5"          #
COLOR_16="#ffffff"          #

BACKGROUND_COLOR="#2e2e35"  # Background Color
FOREGROUND_COLOR="#ffffff"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Tin"
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
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
