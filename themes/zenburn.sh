#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#705050"           # SYNTAX_STRING
COLOR_03="#60b48a"           # COMMAND
COLOR_04="#f0dfaf"           # COMMAND_COLOR2
COLOR_05="#506070"           # PATH
COLOR_06="#dc8cc3"           # SYNTAX_VAR
COLOR_07="#8cd0d3"           # PROMP
COLOR_08="#dcdccc"           #

COLOR_09="#709080"           #
COLOR_10="#dca3a3"           # COMMAND_ERROR
COLOR_11="#c3bf9f"           # EXEC
COLOR_12="#e0cf9f"           #
COLOR_13="#94bff3"           # FOLDER
COLOR_14="#ec93d3"           #
COLOR_15="#93e0e3"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#3f3f3f"   # Background Color
FOREGROUND_COLOR="#dcdccc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Zenburn"
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
