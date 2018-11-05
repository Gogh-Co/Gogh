#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#151515"           # HOST
COLOR_02="#a53c23"           # SYNTAX_STRING
COLOR_03="#7b9246"           # COMMAND
COLOR_04="#d3a04d"           # COMMAND_COLOR2
COLOR_05="#6c99bb"           # PATH
COLOR_06="#9f4e85"           # SYNTAX_VAR
COLOR_07="#7dd6cf"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#505050"           #
COLOR_10="#a53c23"           # COMMAND_ERROR
COLOR_11="#7b9246"           # EXEC
COLOR_12="#d3a04d"           #
COLOR_13="#547c99"           # FOLDER
COLOR_14="#9f4e85"           #
COLOR_15="#7dd6cf"           #
COLOR_16="#f5f5f5"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Afterglow"
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
