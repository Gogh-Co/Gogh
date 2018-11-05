#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#343935"           # HOST
COLOR_02="#cf3f61"           # SYNTAX_STRING
COLOR_03="#7bb75b"           # COMMAND
COLOR_04="#e9b32a"           # COMMAND_COLOR2
COLOR_05="#4c9ad4"           # PATH
COLOR_06="#a57fc4"           # SYNTAX_VAR
COLOR_07="#389aad"           # PROMP
COLOR_08="#fafaf6"           #

COLOR_09="#595b59"           #
COLOR_10="#d18fa6"           # COMMAND_ERROR
COLOR_11="#767f2c"           # EXEC
COLOR_12="#78592f"           #
COLOR_13="#135979"           # FOLDER
COLOR_14="#604291"           #
COLOR_15="#76bbca"           #
COLOR_16="#b2b5ae"           #

BACKGROUND_COLOR="#1e1e1e"   # Background Color
FOREGROUND_COLOR="#f7f6ec"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Japanesque"
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
