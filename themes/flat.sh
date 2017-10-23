#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c3e50"           # HOST
COLOR_02="#c0392b"           # SYNTAX_STRING
COLOR_03="#27ae60"           # COMMAND
COLOR_04="#f39c12"           # COMMAND_COLOR2
COLOR_05="#2980b9"           # PATH
COLOR_06="#8e44ad"           # SYNTAX_VAR
COLOR_07="#16a085"           # PROMP
COLOR_08="#bdc3c7"           #

COLOR_09="#34495e"           #
COLOR_10="#e74c3c"           # COMMAND_ERROR
COLOR_11="#2ecc71"           # EXEC
COLOR_12="#f1c40f"           #
COLOR_13="#3498db"           # FOLDER
COLOR_14="#9b59b6"           #
COLOR_15="#2AA198"           #
COLOR_16="#ecf0f1"           #

BACKGROUND_COLOR="#1F2D3A"   # Background Color
FOREGROUND_COLOR="#1abc9c"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Flat"
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
