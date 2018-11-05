#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#C75646"          # SYNTAX_STRING
COLOR_03="#8EB33B"          # COMMAND
COLOR_04="#D0B03C"          # COMMAND_COLOR2
COLOR_05="#72B3CC"          # PATH
COLOR_06="#C8A0D1"          # SYNTAX_VAR
COLOR_07="#218693"          # PROMP
COLOR_08="#B0B0B0"          #

COLOR_09="#5D5D5D"          #
COLOR_10="#E09690"          # COMMAND_ERROR
COLOR_11="#CDEE69"          # EXEC
COLOR_12="#FFE377"          #
COLOR_13="#9CD9F0"          # FOLDER
COLOR_14="#FBB1F9"          #
COLOR_15="#77DFD8"          #
COLOR_16="#F7F7F7"          #

BACKGROUND_COLOR="#242424"  # Background Color
FOREGROUND_COLOR="#F7F7F7"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Smyck"
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
