#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#230046"           # HOST
COLOR_02="#7d1625"           # SYNTAX_STRING
COLOR_03="#337e6f"           # COMMAND
COLOR_04="#7f6f49"           # COMMAND_COLOR2
COLOR_05="#4f4a7f"           # PATH
COLOR_06="#5a3f7f"           # SYNTAX_VAR
COLOR_07="#58777f"           # PROMP
COLOR_08="#736e7d"           #

COLOR_09="#372d46"           #
COLOR_10="#e05167"           # COMMAND_ERROR
COLOR_11="#52e0c4"           # EXEC
COLOR_12="#e0c386"           #
COLOR_13="#8e87e0"           # FOLDER
COLOR_14="#a776e0"           #
COLOR_15="#9ad4e0"           #
COLOR_16="#8c91fa"           #

BACKGROUND_COLOR="#050014"   # Background Color
FOREGROUND_COLOR="#736e7d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Lavandula"
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
