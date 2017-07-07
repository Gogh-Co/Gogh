#!/usr/bin/env bash

# ====================  CONFIG THIS ========================================= #
COLOR_01="#073642"                # HOST
COLOR_02="#dc322f"                # SYNTAX_STRING
COLOR_03="#859900"                # COMMAND
COLOR_04="#b58900"                # COMMAND_COLOR2
COLOR_05="#268bd2"                # PATH
COLOR_06="#ec0048"                # SYNTAX_VAR
COLOR_07="#2aa198"                # PROMP
COLOR_08="#94a3a5"

COLOR_09="#586e75"
COLOR_10="#cb4b16"                # COMMAND_ERROR
COLOR_11="#859900"                # EXEC
COLOR_12="#b58900"
COLOR_13="#268bd2"                # FOLDER
COLOR_14="#d33682"
COLOR_15="#2aa198"
COLOR_16="#6c71c4"

BACKGROUND_COLOR="#252e32"        # Background Color
FOREGROUND_COLOR="#94a3a5"        # Text
CURSOR_COLOR="#839496"            # Cursor
# =====================  END CONFIG   ======================================= #







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
