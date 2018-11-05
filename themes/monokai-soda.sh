#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1a1a1a"           # HOST
COLOR_02="#f4005f"           # SYNTAX_STRING
COLOR_03="#98e024"           # COMMAND
COLOR_04="#fa8419"           # COMMAND_COLOR2
COLOR_05="#9d65ff"           # PATH
COLOR_06="#f4005f"           # SYNTAX_VAR
COLOR_07="#58d1eb"           # PROMP
COLOR_08="#c4c5b5"           #

COLOR_09="#625e4c"           #
COLOR_10="#f4005f"           # COMMAND_ERROR
COLOR_11="#98e024"           # EXEC
COLOR_12="#e0d561"           #
COLOR_13="#9d65ff"           # FOLDER
COLOR_14="#f4005f"           #
COLOR_15="#58d1eb"           #
COLOR_16="#f6f6ef"           #

BACKGROUND_COLOR="#1a1a1a"   # Background Color
FOREGROUND_COLOR="#c4c5b5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Monokai Soda"
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
