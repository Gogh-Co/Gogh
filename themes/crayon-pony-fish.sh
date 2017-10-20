#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2b1b1d"           # HOST
COLOR_02="#91002b"           # SYNTAX_STRING
COLOR_03="#579524"           # COMMAND
COLOR_04="#ab311b"           # COMMAND_COLOR2
COLOR_05="#8c87b0"           # PATH
COLOR_06="#692f50"           # SYNTAX_VAR
COLOR_07="#e8a866"           # PROMP
COLOR_08="#68525a"           #

COLOR_09="#3d2b2e"           #
COLOR_10="#c5255d"           # COMMAND_ERROR
COLOR_11="#8dff57"           # EXEC
COLOR_12="#c8381d"           #
COLOR_13="#cfc9ff"           # FOLDER
COLOR_14="#fc6cba"           #
COLOR_15="#ffceaf"           #
COLOR_16="#b0949d"           #

BACKGROUND_COLOR="#150707"   # Background Color
FOREGROUND_COLOR="#68525a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Crayon Pony Fish"
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
