#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#230046"           # HOST
COLOR_02="#7d1625"           # SYNTAX_STRING
COLOR_03="#337e6f"           # COMMAND
COLOR_04="#7f6f49"           # COMMAND_COLOR2
COLOR_05="#4f4a7f"           # PATH
COLOR_06="#5a3f7f"           # SYNTAX_VAR
COLOR_07="#58777f"           # PROMP
COLOR_08="#736e7d"           #

COLOR_09="#372d46"           #
COLOR_10="#e05167"           # COMMAND_ERROR
COLOR_11="#52e0c4"           # EXEC
COLOR_12="#e0c386"           #
COLOR_13="#8e87e0"           # FOLDER
COLOR_14="#a776e0"           #
COLOR_15="#9ad4e0"           #
COLOR_16="#8c91fa"           #

BACKGROUND_COLOR="#050014"   # Background Color
FOREGROUND_COLOR="#736e7d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Lavandula"
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
