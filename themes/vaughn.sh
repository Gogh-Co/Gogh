#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#25234f"           # HOST
COLOR_02="#705050"           # SYNTAX_STRING
COLOR_03="#60b48a"           # COMMAND
COLOR_04="#dfaf8f"           # COMMAND_COLOR2
COLOR_05="#5555ff"           # PATH
COLOR_06="#f08cc3"           # SYNTAX_VAR
COLOR_07="#8cd0d3"           # PROMP
COLOR_08="#709080"           #

COLOR_09="#709080"           #
COLOR_10="#dca3a3"           # COMMAND_ERROR
COLOR_11="#60b48a"           # EXEC
COLOR_12="#f0dfaf"           #
COLOR_13="#5555ff"           # FOLDER
COLOR_14="#ec93d3"           #
COLOR_15="#93e0e3"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#25234f"   # Background Color
FOREGROUND_COLOR="#dcdccc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Vaughn"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
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
