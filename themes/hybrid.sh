#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#282a2e"           # HOST
COLOR_02="#A54242"           # SYNTAX_STRING
COLOR_03="#8C9440"           # COMMAND
COLOR_04="#de935f"           # COMMAND_COLOR2
COLOR_05="#5F819D"           # PATH
COLOR_06="#85678F"           # SYNTAX_VAR
COLOR_07="#5E8D87"           # PROMP
COLOR_08="#969896"           #

COLOR_09="#373b41"           #
COLOR_10="#cc6666"           # COMMAND_ERROR
COLOR_11="#b5bd68"           # EXEC
COLOR_12="#f0c674"           #
COLOR_13="#81a2be"           # FOLDER
COLOR_14="#b294bb"           #
COLOR_15="#8abeb7"           #
COLOR_16="#c5c8c6"           #

BACKGROUND_COLOR="#141414"   # Background Color
FOREGROUND_COLOR="#94a3a5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hybrid"
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
