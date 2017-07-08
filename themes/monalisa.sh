#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#351b0e"           # HOST
COLOR_02="#9b291c"           # SYNTAX_STRING
COLOR_03="#636232"           # COMMAND
COLOR_04="#c36e28"           # COMMAND_COLOR2
COLOR_05="#515c5d"           # PATH
COLOR_06="#9b1d29"           # SYNTAX_VAR
COLOR_07="#588056"           # PROMP
COLOR_08="#f7d75c"           #

COLOR_09="#874228"           #
COLOR_10="#ff4331"           # COMMAND_ERROR
COLOR_11="#b4b264"           # EXEC
COLOR_12="#ff9566"           #
COLOR_13="#9eb2b4"           # FOLDER
COLOR_14="#ff5b6a"           #
COLOR_15="#8acd8f"           #
COLOR_16="#ffe598"           #

BACKGROUND_COLOR="#120b0d"   # Background Color
FOREGROUND_COLOR="#f7d66a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Mona Lisa"
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
