#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#321300"           # HOST
COLOR_02="#b2270e"           # SYNTAX_STRING
COLOR_03="#44a900"           # COMMAND
COLOR_04="#aa820c"           # COMMAND_COLOR2
COLOR_05="#58859a"           # PATH
COLOR_06="#97363d"           # SYNTAX_VAR
COLOR_07="#b25a1e"           # PROMP
COLOR_08="#786b53"           #

COLOR_09="#433626"           #
COLOR_10="#ed5d20"           # COMMAND_ERROR
COLOR_11="#55f238"           # EXEC
COLOR_12="#f2b732"           #
COLOR_13="#85cfed"           # FOLDER
COLOR_14="#e14c5a"           #
COLOR_15="#f07d14"           #
COLOR_16="#ffc800"           #

BACKGROUND_COLOR="#191919"   # Background Color
FOREGROUND_COLOR="#786b53"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Treehouse"
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
