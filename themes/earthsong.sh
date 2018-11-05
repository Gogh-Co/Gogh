#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#121418"           # HOST
COLOR_02="#c94234"           # SYNTAX_STRING
COLOR_03="#85c54c"           # COMMAND
COLOR_04="#f5ae2e"           # COMMAND_COLOR2
COLOR_05="#1398b9"           # PATH
COLOR_06="#d0633d"           # SYNTAX_VAR
COLOR_07="#509552"           # PROMP
COLOR_08="#e5c6aa"           #

COLOR_09="#675f54"           #
COLOR_10="#ff645a"           # COMMAND_ERROR
COLOR_11="#98e036"           # EXEC
COLOR_12="#e0d561"           #
COLOR_13="#5fdaff"           # FOLDER
COLOR_14="#ff9269"           #
COLOR_15="#84f088"           #
COLOR_16="#f6f7ec"           #

BACKGROUND_COLOR="#292520"   # Background Color
FOREGROUND_COLOR="#e5c7a9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Earthsong"
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
