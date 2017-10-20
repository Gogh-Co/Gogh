#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#a2686a"           # SYNTAX_STRING
COLOR_03="#9aa56a"           # COMMAND
COLOR_04="#a3906a"           # COMMAND_COLOR2
COLOR_05="#6b8fa3"           # PATH
COLOR_06="#6a71a3"           # SYNTAX_VAR
COLOR_07="#6ba58f"           # PROMP
COLOR_08="#99a3a2"           #

COLOR_09="#666c6c"           #
COLOR_10="#dd5c60"           # COMMAND_ERROR
COLOR_11="#bfdf55"           # EXEC
COLOR_12="#deb360"           #
COLOR_13="#62b1df"           # FOLDER
COLOR_14="#606edf"           #
COLOR_15="#64e39c"           #
COLOR_16="#d2e0de"           #

BACKGROUND_COLOR="#242626"   # Background Color
FOREGROUND_COLOR="#99a3a2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Soft Server"
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
