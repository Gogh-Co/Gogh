#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#141414"           # HOST
COLOR_02="#c06d44"           # SYNTAX_STRING
COLOR_03="#afb97a"           # COMMAND
COLOR_04="#c2a86c"           # COMMAND_COLOR2
COLOR_05="#44474a"           # PATH
COLOR_06="#b4be7c"           # SYNTAX_VAR
COLOR_07="#778385"           # PROMP
COLOR_08="#ffffd4"           #

COLOR_09="#262626"           #
COLOR_10="#de7c4c"           # COMMAND_ERROR
COLOR_11="#ccd88c"           # EXEC
COLOR_12="#e2c47e"           #
COLOR_13="#5a5e62"           # FOLDER
COLOR_14="#d0dc8e"           #
COLOR_15="#8a989b"           #
COLOR_16="#ffffd4"           #

BACKGROUND_COLOR="#141414"   # Background Color
FOREGROUND_COLOR="#ffffd4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Twilight"
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

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

gogh_colors
if [ -e $PARENT_PATH"/apply-colors.sh" ]; then
    source $PARENT_PATH"/apply-colors.sh"
else
    source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
