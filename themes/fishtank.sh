#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#03073c"           # HOST
COLOR_02="#c6004a"           # SYNTAX_STRING
COLOR_03="#acf157"           # COMMAND
COLOR_04="#fecd5e"           # COMMAND_COLOR2
COLOR_05="#525fb8"           # PATH
COLOR_06="#986f82"           # SYNTAX_VAR
COLOR_07="#968763"           # PROMP
COLOR_08="#ecf0fc"           #

COLOR_09="#6c5b30"           #
COLOR_10="#da4b8a"           # COMMAND_ERROR
COLOR_11="#dbffa9"           # EXEC
COLOR_12="#fee6a9"           #
COLOR_13="#b2befa"           # FOLDER
COLOR_14="#fda5cd"           #
COLOR_15="#a5bd86"           #
COLOR_16="#f6ffec"           #

BACKGROUND_COLOR="#232537"   # Background Color
FOREGROUND_COLOR="#ecf0fe"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Fishtank"
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
