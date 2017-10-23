#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#44475a"           # HOST
COLOR_02="#ff5555"           # SYNTAX_STRING
COLOR_03="#50fa7b"           # COMMAND
COLOR_04="#ffb86c"           # COMMAND_COLOR2
COLOR_05="#8be9fd"           # PATH
COLOR_06="#bd93f9"           # SYNTAX_VAR
COLOR_07="#ff79c6"           # PROMP
COLOR_08="#94A3A5"           #

COLOR_09="#000000"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#50fa7b"           # EXEC
COLOR_12="#ffb86c"           #
COLOR_13="#8be9fd"           # FOLDER
COLOR_14="#bd93f9"           #
COLOR_15="#ff79c6"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#282a36"   # Background Color
FOREGROUND_COLOR="#94A3A5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Dracula"
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
