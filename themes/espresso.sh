#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535"           # HOST
COLOR_02="#d25252"           # SYNTAX_STRING
COLOR_03="#a5c261"           # COMMAND
COLOR_04="#ffc66d"           # COMMAND_COLOR2
COLOR_05="#6c99bb"           # PATH
COLOR_06="#d197d9"           # SYNTAX_VAR
COLOR_07="#bed6ff"           # PROMP
COLOR_08="#eeeeec"           #

COLOR_09="#535353"           #
COLOR_10="#f00c0c"           # COMMAND_ERROR
COLOR_11="#c2e075"           # EXEC
COLOR_12="#e1e48b"           #
COLOR_13="#8ab7d9"           # FOLDER
COLOR_14="#efb5f7"           #
COLOR_15="#dcf4ff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#323232"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Espresso"
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
