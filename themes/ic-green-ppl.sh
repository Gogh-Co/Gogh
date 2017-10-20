#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1f1f1f"           # HOST
COLOR_02="#fb002a"           # SYNTAX_STRING
COLOR_03="#339c24"           # COMMAND
COLOR_04="#659b25"           # COMMAND_COLOR2
COLOR_05="#149b45"           # PATH
COLOR_06="#53b82c"           # SYNTAX_VAR
COLOR_07="#2cb868"           # PROMP
COLOR_08="#e0ffef"           #

COLOR_09="#032710"           #
COLOR_10="#a7ff3f"           # COMMAND_ERROR
COLOR_11="#9fff6d"           # EXEC
COLOR_12="#d2ff6d"           #
COLOR_13="#72ffb5"           # FOLDER
COLOR_14="#50ff3e"           #
COLOR_15="#22ff71"           #
COLOR_16="#daefd0"           #

BACKGROUND_COLOR="#3a3d3f"   # Background Color
FOREGROUND_COLOR="#d9efd3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="IC Green PPL"
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
