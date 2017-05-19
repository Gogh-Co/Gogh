#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c2423"           # HOST
COLOR_02="#ab2463"           # SYNTAX_STRING
COLOR_03="#6ca323"           # COMMAND
COLOR_04="#ab6423"           # COMMAND_COLOR2
COLOR_05="#2c64a2"           # PATH
COLOR_06="#6c24a2"           # SYNTAX_VAR
COLOR_07="#2ca363"           # PROMP
COLOR_08="#918988"           #

COLOR_09="#918988"           #
COLOR_10="#f588b9"           # COMMAND_ERROR
COLOR_11="#c2ee86"           # EXEC
COLOR_12="#f5ba86"           #
COLOR_13="#8fbaec"           # FOLDER
COLOR_14="#c288ec"           #
COLOR_15="#8feeb9"           #
COLOR_16="#f5eeec"           #

BACKGROUND_COLOR="#2a201f"   # Background Color
FOREGROUND_COLOR="#4882cd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
