#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#17384c"           # HOST
COLOR_02="#d15123"           # SYNTAX_STRING
COLOR_03="#027c9b"           # COMMAND
COLOR_04="#fca02f"           # COMMAND_COLOR2
COLOR_05="#1e4950"           # PATH
COLOR_06="#68d4f1"           # SYNTAX_VAR
COLOR_07="#50a3b5"           # PROMP
COLOR_08="#deb88d"           #

COLOR_09="#434b53"           #
COLOR_10="#d48678"           # COMMAND_ERROR
COLOR_11="#628d98"           # EXEC
COLOR_12="#fdd39f"           #
COLOR_13="#1bbcdd"           # FOLDER
COLOR_14="#bbe3ee"           #
COLOR_15="#87acb4"           #
COLOR_16="#fee4ce"           #

BACKGROUND_COLOR="#09141b"   # Background Color
FOREGROUND_COLOR="#deb88d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sea Shells"
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
