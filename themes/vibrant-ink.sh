#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#878787"           # HOST
COLOR_02="#ff6600"           # SYNTAX_STRING
COLOR_03="#ccff04"           # COMMAND
COLOR_04="#ffcc00"           # COMMAND_COLOR2
COLOR_05="#44b4cc"           # PATH
COLOR_06="#9933cc"           # SYNTAX_VAR
COLOR_07="#44b4cc"           # PROMP
COLOR_08="#f5f5f5"           #

COLOR_09="#555555"           #
COLOR_10="#ff0000"           # COMMAND_ERROR
COLOR_11="#00ff00"           # EXEC
COLOR_12="#ffff00"           #
COLOR_13="#0000ff"           # FOLDER
COLOR_14="#ff00ff"           #
COLOR_15="#00ffff"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Vibrant Ink"
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
