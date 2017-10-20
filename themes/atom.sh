#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#fd5ff1"           # SYNTAX_STRING
COLOR_03="#87c38a"           # COMMAND
COLOR_04="#ffd7b1"           # COMMAND_COLOR2
COLOR_05="#85befd"           # PATH
COLOR_06="#b9b6fc"           # SYNTAX_VAR
COLOR_07="#85befd"           # PROMP
COLOR_08="#e0e0e0"           #

COLOR_09="#000000"           #
COLOR_10="#fd5ff1"           # COMMAND_ERROR
COLOR_11="#94fa36"           # EXEC
COLOR_12="#f5ffa8"           #
COLOR_13="#96cbfe"           # FOLDER
COLOR_14="#b9b6fc"           #
COLOR_15="#85befd"           #
COLOR_16="#e0e0e0"           #

BACKGROUND_COLOR="#161719"   # Background Color
FOREGROUND_COLOR="#c5c8c6"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Atom"
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
