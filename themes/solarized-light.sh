#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073642"           # HOST
COLOR_02="#DC322F"           # SYNTAX_STRING
COLOR_03="#859900"           # COMMAND
COLOR_04="#B58900"           # COMMAND_COLOR2
COLOR_05="#268BD2"           # PATH
COLOR_06="#D33682"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#EEE8D5"           #

COLOR_09="#002B36"           #
COLOR_10="#CB4B16"           # COMMAND_ERROR
COLOR_11="#586E75"           # EXEC
COLOR_12="#657B83"           #
COLOR_13="#839496"           # FOLDER
COLOR_14="#6C71C4"           #
COLOR_15="#93A1A1"           #
COLOR_16="#FDF6E3"           #

BACKGROUND_COLOR="#FDF6E3"   # Background Color
FOREGROUND_COLOR="#657B83"   # Text
BOLD_COLOR="#586E75"         # Bold
PROFILE_NAME="Solarized-light"
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
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
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
    if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
