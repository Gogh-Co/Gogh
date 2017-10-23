#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#dd0007"          # SYNTAX_STRING
COLOR_03="#07dd00"          # COMMAND
COLOR_04="#ddd600"          # COMMAND_COLOR2
COLOR_05="#0007dd"          # PATH
COLOR_06="#d600dd"          # SYNTAX_VAR
COLOR_07="#00ddd6"          # PROMP
COLOR_08="#f2f2f2"          #

COLOR_09="#7d7d7d"          #
COLOR_10="#ff7478"          # COMMAND_ERROR
COLOR_11="#78ff74"          # EXEC
COLOR_12="#fffa74"          #
COLOR_13="#7478ff"          # FOLDER
COLOR_14="#fa74ff"          #
COLOR_15="#74fffa"          #
COLOR_16="#ffffff"          #

BACKGROUND_COLOR="#758480"  # Background Color
FOREGROUND_COLOR="#23476a"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sat"
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
