#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ac2e31"           # SYNTAX_STRING
COLOR_03="#31ac61"           # COMMAND
COLOR_04="#ac4300"           # COMMAND_COLOR2
COLOR_05="#2d57ac"           # PATH
COLOR_06="#b08528"           # SYNTAX_VAR
COLOR_07="#1fa6ac"           # PROMP
COLOR_08="#8a8eac"           #

COLOR_09="#5b3725"           #
COLOR_10="#ff3d48"           # COMMAND_ERROR
COLOR_11="#3bff99"           # EXEC
COLOR_12="#ff5e1e"           #
COLOR_13="#4488ff"           # FOLDER
COLOR_14="#ffc21d"           #
COLOR_15="#1ffaff"           #
COLOR_16="#5b6ea7"           #

BACKGROUND_COLOR="#222125"   # Background Color
FOREGROUND_COLOR="#8a8dae"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Ollie"
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
