#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#e24346"           # SYNTAX_STRING
COLOR_03="#39b13a"           # COMMAND
COLOR_04="#dae145"           # COMMAND_COLOR2
COLOR_05="#4261c5"           # PATH
COLOR_06="#f920fb"           # SYNTAX_VAR
COLOR_07="#2abbd4"           # PROMP
COLOR_08="#d0b8a3"           #

COLOR_09="#fefcfc"           #
COLOR_10="#e97071"           # COMMAND_ERROR
COLOR_11="#9cc090"           # EXEC
COLOR_12="#ddda7a"           #
COLOR_13="#7b91d6"           # FOLDER
COLOR_14="#f674ba"           #
COLOR_15="#5ed1e5"           #
COLOR_16="#d8c8bb"           #

BACKGROUND_COLOR="#404040"   # Background Color
FOREGROUND_COLOR="#afdab6"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Warm Neon"
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
