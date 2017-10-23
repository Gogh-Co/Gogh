#!/usr/bin/env bash

# ====================  CONFIG THIS ========================================= #
COLOR_01="#073642"                # HOST
COLOR_02="#dc322f"                # SYNTAX_STRING
COLOR_03="#859900"                # COMMAND
COLOR_04="#b58900"                # COMMAND_COLOR2
COLOR_05="#268bd2"                # PATH
COLOR_06="#ec0048"                # SYNTAX_VAR
COLOR_07="#2aa198"                # PROMP
COLOR_08="#94a3a5"

COLOR_09="#586e75"
COLOR_10="#cb4b16"                # COMMAND_ERROR
COLOR_11="#859900"                # EXEC
COLOR_12="#b58900"
COLOR_13="#268bd2"                # FOLDER
COLOR_14="#d33682"
COLOR_15="#2aa198"
COLOR_16="#6c71c4"

BACKGROUND_COLOR="#252e32"        # Background Color
FOREGROUND_COLOR="#94a3a5"        # Text
CURSOR_COLOR="#839496"            # Cursor
PROFILE_NAME="Freya"
# =====================  END CONFIG   ======================================= #







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
