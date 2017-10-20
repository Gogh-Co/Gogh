#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d6262b"           # SYNTAX_STRING
COLOR_03="#919c00"           # COMMAND
COLOR_04="#be8a13"           # COMMAND_COLOR2
COLOR_05="#4699a3"           # PATH
COLOR_06="#8d4331"           # SYNTAX_VAR
COLOR_07="#da8213"           # PROMP
COLOR_08="#ddc265"           #

COLOR_09="#7f6a55"           #
COLOR_10="#e55a1c"           # COMMAND_ERROR
COLOR_11="#bfc65a"           # EXEC
COLOR_12="#ffcb1b"           #
COLOR_13="#7cc9cf"           # FOLDER
COLOR_14="#d26349"           #
COLOR_15="#e6a96b"           #
COLOR_16="#ffeaa3"           #

BACKGROUND_COLOR="#251200"   # Background Color
FOREGROUND_COLOR="#dec165"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Frontend Fun Forrest"
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
