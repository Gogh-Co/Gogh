#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#002831"           # HOST
COLOR_02="#d11c24"           # SYNTAX_STRING
COLOR_03="#6cbe6c"           # COMMAND
COLOR_04="#a57706"           # COMMAND_COLOR2
COLOR_05="#2176c7"           # PATH
COLOR_06="#c61c6f"           # SYNTAX_VAR
COLOR_07="#259286"           # PROMP
COLOR_08="#eae3cb"           #

COLOR_09="#006488"           #
COLOR_10="#f5163b"           # COMMAND_ERROR
COLOR_11="#51ef84"           # EXEC
COLOR_12="#b27e28"           #
COLOR_13="#178ec8"           # FOLDER
COLOR_14="#e24d8e"           #
COLOR_15="#00b39e"           #
COLOR_16="#fcf4dc"           #

BACKGROUND_COLOR="#001e27"   # Background Color
FOREGROUND_COLOR="#9cc2c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Dark Higher Contrast"
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
