#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1C1B19"           # HOST
COLOR_02="#FF3128"           # SYNTAX_STRING
COLOR_03="#519F50"           # COMMAND
COLOR_04="#FBB829"           # COMMAND_COLOR2
COLOR_05="#5573A3"           # PATH
COLOR_06="#E02C6D"           # SYNTAX_VAR
COLOR_07="#0AAEB3"           # PROMP
COLOR_08="#918175"           #

COLOR_09="#2D2B28"           #
COLOR_10="#F75341"           # COMMAND_ERROR
COLOR_11="#98BC37"           # EXEC
COLOR_12="#FED06E"           #
COLOR_13="#8EB2F7"           # FOLDER
COLOR_14="#E35682"           #
COLOR_15="#53FDE9"           #
COLOR_16="#FCE8C3"           #

BACKGROUND_COLOR="#282828"   # Background Color
FOREGROUND_COLOR="#ebdbb2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="srcery"
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
