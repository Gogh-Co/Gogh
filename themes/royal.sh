#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#241f2b"           # HOST
COLOR_02="#91284c"           # SYNTAX_STRING
COLOR_03="#23801c"           # COMMAND
COLOR_04="#b49d27"           # COMMAND_COLOR2
COLOR_05="#6580b0"           # PATH
COLOR_06="#674d96"           # SYNTAX_VAR
COLOR_07="#8aaabe"           # PROMP
COLOR_08="#524966"           #

COLOR_09="#312d3d"           #
COLOR_10="#d5356c"           # COMMAND_ERROR
COLOR_11="#2cd946"           # EXEC
COLOR_12="#fde83b"           #
COLOR_13="#90baf9"           # FOLDER
COLOR_14="#a479e3"           #
COLOR_15="#acd4eb"           #
COLOR_16="#9e8cbd"           #

BACKGROUND_COLOR="#100815"   # Background Color
FOREGROUND_COLOR="#514968"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Royal"
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
