#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cdaf95"           # SYNTAX_STRING
COLOR_03="#a8ff60"           # COMMAND
COLOR_04="#bfbb1f"           # COMMAND_COLOR2
COLOR_05="#75a5b0"           # PATH
COLOR_06="#ff73fd"           # SYNTAX_VAR
COLOR_07="#5a647e"           # PROMP
COLOR_08="#bfbfbf"           #

COLOR_09="#666666"           #
COLOR_10="#eecbad"           # COMMAND_ERROR
COLOR_11="#bcee68"           # EXEC
COLOR_12="#e5e500"           #
COLOR_13="#86bdc9"           # FOLDER
COLOR_14="#e500e5"           #
COLOR_15="#8c9bc4"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#2b2b2b"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Rippedcasts"
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
