#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c1d16"           # HOST
COLOR_02="#ef5734"           # SYNTAX_STRING
COLOR_03="#2baf2b"           # COMMAND
COLOR_04="#bebf00"           # COMMAND_COLOR2
COLOR_05="#246eb2"           # PATH
COLOR_06="#d05ec1"           # SYNTAX_VAR
COLOR_07="#00acee"           # PROMP
COLOR_08="#bfbfbf"           #

COLOR_09="#666666"           #
COLOR_10="#e50000"           # COMMAND_ERROR
COLOR_11="#86a93e"           # EXEC
COLOR_12="#e5e500"           #
COLOR_13="#0000ff"           # FOLDER
COLOR_14="#e500e5"           #
COLOR_15="#00e5e5"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#2c1d16"   # Background Color
FOREGROUND_COLOR="#ffcc2f"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Jackie Brown"
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
