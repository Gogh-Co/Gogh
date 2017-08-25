#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#646464"           # HOST
COLOR_02="#F58E8E"           # SYNTAX_STRING
COLOR_03="#A9D3AB"           # COMMAND
COLOR_04="#FED37E"           # COMMAND_COLOR2
COLOR_05="#7AABD4"           # PATH
COLOR_06="#D6ADD5"           # SYNTAX_VAR
COLOR_07="#79D4D5"           # PROMP
COLOR_08="#D4D4D4"           #

COLOR_09="#646464"           #
COLOR_10="#F58E8E"           # COMMAND_ERROR
COLOR_11="#A9D3AB"           # EXEC
COLOR_12="#FED37E"           #
COLOR_13="#7AABD4"           # FOLDER
COLOR_14="#D6ADD5"           #
COLOR_15="#79D4D5"           #
COLOR_16="#D4D4D4"           #

BACKGROUND_COLOR="#2D2D2D"   # Background Color
FOREGROUND_COLOR="#D4D4D4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Chalk"
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
