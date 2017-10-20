#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4c4c4c"           # HOST
COLOR_02="#bb0000"           # SYNTAX_STRING
COLOR_03="#04f623"           # COMMAND
COLOR_04="#f3f167"           # COMMAND_COLOR2
COLOR_05="#64d0f0"           # PATH
COLOR_06="#ce6fdb"           # SYNTAX_VAR
COLOR_07="#00dadf"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#555555"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#7df71d"           # EXEC
COLOR_12="#ffff55"           #
COLOR_13="#62cbe8"           # FOLDER
COLOR_14="#ff9bf5"           #
COLOR_15="#00ccd8"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#171717"   # Background Color
FOREGROUND_COLOR="#bbbbbb"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Nightlion V2"
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
