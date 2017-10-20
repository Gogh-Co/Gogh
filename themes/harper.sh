#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#010101"           # HOST
COLOR_02="#f8b63f"           # SYNTAX_STRING
COLOR_03="#7fb5e1"           # COMMAND
COLOR_04="#d6da25"           # COMMAND_COLOR2
COLOR_05="#489e48"           # PATH
COLOR_06="#b296c6"           # SYNTAX_VAR
COLOR_07="#f5bfd7"           # PROMP
COLOR_08="#a8a49d"           #

COLOR_09="#726e6a"           #
COLOR_10="#f8b63f"           # COMMAND_ERROR
COLOR_11="#7fb5e1"           # EXEC
COLOR_12="#d6da25"           #
COLOR_13="#489e48"           # FOLDER
COLOR_14="#b296c6"           #
COLOR_15="#f5bfd7"           #
COLOR_16="#fefbea"           #

BACKGROUND_COLOR="#010101"   # Background Color
FOREGROUND_COLOR="#a8a49d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Harper"
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
