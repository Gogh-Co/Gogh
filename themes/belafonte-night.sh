#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#20111b"           # HOST
COLOR_02="#be100e"           # SYNTAX_STRING
COLOR_03="#858162"           # COMMAND
COLOR_04="#eaa549"           # COMMAND_COLOR2
COLOR_05="#426a79"           # PATH
COLOR_06="#97522c"           # SYNTAX_VAR
COLOR_07="#989a9c"           # PROMP
COLOR_08="#968c83"           #

COLOR_09="#5e5252"           #
COLOR_10="#be100e"           # COMMAND_ERROR
COLOR_11="#858162"           # EXEC
COLOR_12="#eaa549"           #
COLOR_13="#426a79"           # FOLDER
COLOR_14="#97522c"           #
COLOR_15="#989a9c"           #
COLOR_16="#d5ccba"           #

BACKGROUND_COLOR="#20111b"   # Background Color
FOREGROUND_COLOR="#968c83"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Belafonte Night"
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
