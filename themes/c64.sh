#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#090300"           # HOST
COLOR_02="#883932"           # SYNTAX_STRING
COLOR_03="#55a049"           # COMMAND
COLOR_04="#bfce72"           # COMMAND_COLOR2
COLOR_05="#40318d"           # PATH
COLOR_06="#8b3f96"           # SYNTAX_VAR
COLOR_07="#67b6bd"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#000000"           #
COLOR_10="#883932"           # COMMAND_ERROR
COLOR_11="#55a049"           # EXEC
COLOR_12="#bfce72"           #
COLOR_13="#40318d"           # FOLDER
COLOR_14="#8b3f96"           #
COLOR_15="#67b6bd"           #
COLOR_16="#f7f7f7"           #

BACKGROUND_COLOR="#40318d"   # Background Color
FOREGROUND_COLOR="#7869c4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="C64"
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
