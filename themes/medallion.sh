#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b64c00"           # SYNTAX_STRING
COLOR_03="#7c8b16"           # COMMAND
COLOR_04="#d3bd26"           # COMMAND_COLOR2
COLOR_05="#616bb0"           # PATH
COLOR_06="#8c5a90"           # SYNTAX_VAR
COLOR_07="#916c25"           # PROMP
COLOR_08="#cac29a"           #

COLOR_09="#5e5219"           #
COLOR_10="#ff9149"           # COMMAND_ERROR
COLOR_11="#b2ca3b"           # EXEC
COLOR_12="#ffe54a"           #
COLOR_13="#acb8ff"           # FOLDER
COLOR_14="#ffa0ff"           #
COLOR_15="#ffbc51"           #
COLOR_16="#fed698"           #

BACKGROUND_COLOR="#1d1908"   # Background Color
FOREGROUND_COLOR="#cac296"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Medallion"
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
