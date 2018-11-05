#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#c13900"           # SYNTAX_STRING
COLOR_03="#a4a900"           # COMMAND
COLOR_04="#caaf00"           # COMMAND_COLOR2
COLOR_05="#bd6d00"           # PATH
COLOR_06="#fc5e00"           # SYNTAX_VAR
COLOR_07="#f79500"           # PROMP
COLOR_08="#ffc88a"           #

COLOR_09="#6a4f2a"           #
COLOR_10="#ff8c68"           # COMMAND_ERROR
COLOR_11="#f6ff40"           # EXEC
COLOR_12="#ffe36e"           #
COLOR_13="#ffbe55"           # FOLDER
COLOR_14="#fc874f"           #
COLOR_15="#c69752"           #
COLOR_16="#fafaff"           #

BACKGROUND_COLOR="#262626"   # Background Color
FOREGROUND_COLOR="#ffcb83"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="IC Orange PPL"
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
