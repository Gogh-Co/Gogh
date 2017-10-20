#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2d283f"           # HOST
COLOR_02="#ed2261"           # SYNTAX_STRING
COLOR_03="#1fa91b"           # COMMAND
COLOR_04="#8ddc20"           # COMMAND_COLOR2
COLOR_05="#487df4"           # PATH
COLOR_06="#8d35c9"           # SYNTAX_VAR
COLOR_07="#3bdeed"           # PROMP
COLOR_08="#9e9ea0"           #

COLOR_09="#59516a"           #
COLOR_10="#f0729a"           # COMMAND_ERROR
COLOR_11="#53aa5e"           # EXEC
COLOR_12="#b2dc87"           #
COLOR_13="#a9bcec"           # FOLDER
COLOR_14="#ad81c2"           #
COLOR_15="#9de3eb"           #
COLOR_16="#a288f7"           #

BACKGROUND_COLOR="#171423"   # Background Color
FOREGROUND_COLOR="#9f9fa1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Grape"
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
