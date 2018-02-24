#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#7325FA"           # SYNTAX_STRING
COLOR_03="#23E298"           # COMMAND
COLOR_04="#60D4DF"           # COMMAND_COLOR2
COLOR_05="#D08010"           # PATH
COLOR_06="#FF0087"           # SYNTAX_VAR
COLOR_07="#D0A843"           # PROMP
COLOR_08="#BBBBBB"           #

COLOR_09="#555555"           #
COLOR_10="#9D66F6"           # COMMAND_ERROR
COLOR_11="#5FE0B1"           # EXEC
COLOR_12="#6DF2FF"           #
COLOR_13="#FFAF00"           # FOLDER
COLOR_14="#FF87AF"           #
COLOR_15="#FFCE51"           #
COLOR_16="#FFFFFF"           #

BACKGROUND_COLOR="#1b1d1e"   # Background Color
FOREGROUND_COLOR="#BBBBBB"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Molokai"
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
