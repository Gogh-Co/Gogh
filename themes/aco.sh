#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3f3f3f"           # HOST
COLOR_02="#ff0883"           # SYNTAX_STRING
COLOR_03="#83ff08"           # COMMAND
COLOR_04="#ff8308"           # COMMAND_COLOR2
COLOR_05="#0883ff"           # PATH
COLOR_06="#8308ff"           # SYNTAX_VAR
COLOR_07="#08ff83"           # PROMP
COLOR_08="#bebebe"           #

COLOR_09="#474747"           #
COLOR_10="#ff1e8e"           # COMMAND_ERROR
COLOR_11="#8eff1e"           # EXEC
COLOR_12="#ff8e1e"           #
COLOR_13="#1e8eff"           # FOLDER
COLOR_14="#8e1eff"           #
COLOR_15="#1eff8e"           #
COLOR_16="#c4c4c4"           #

BACKGROUND_COLOR="#1f1305"   # Background Color
FOREGROUND_COLOR="#b4e1fd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Aco"
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
