#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#75715e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#a6e22e"           # COMMAND
COLOR_04="#f4bf75"           # COMMAND_COLOR2
COLOR_05="#66d9ef"           # PATH
COLOR_06="#ae81ff"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#f9f8f5"           #

COLOR_09="#272822"           #
COLOR_10="#f92672"           # COMMAND_ERROR
COLOR_11="#a6e22e"           # EXEC
COLOR_12="#f4bf75"           #
COLOR_13="#66d9ef"           # FOLDER
COLOR_14="#ae81ff"           #
COLOR_15="#2AA198"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#272822"   # Background Color
FOREGROUND_COLOR="#f8f8f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Monokai Dark"
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
