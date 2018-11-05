#!/usr/bin/env bash
# This is an adaptation of the "One Half Dark" color scheme published by
# Son A. Pham under the MIT license: https://github.com/sonph/onehalf

# ====================CONFIG THIS =============================== #
COLOR_01="#282c34"           # HOST
COLOR_02="#e06c75"           # SYNTAX_STRING
COLOR_03="#98c379"           # COMMAND
COLOR_04="#e5c07b"           # COMMAND_COLOR2
COLOR_05="#61afef"           # PATH
COLOR_06="#c678dd"           # SYNTAX_VAR
COLOR_07="#56b6c2"           # PROMP
COLOR_08="#dcdfe4"           #

COLOR_09="#282c34"           #
COLOR_10="#e06c75"           # COMMAND_ERROR
COLOR_11="#98c379"           # EXEC
COLOR_12="#e5c07b"           #
COLOR_13="#61afef"           # FOLDER
COLOR_14="#c678dd"           #
COLOR_15="#56b6c2"           #
COLOR_16="#dcdfe4"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#dcdfe4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="One Half Black"
# =============================================







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
