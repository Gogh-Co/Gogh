#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#c21b6f"          # SYNTAX_STRING
COLOR_03="#6fc21b"          # COMMAND
COLOR_04="#c26f1b"          # COMMAND_COLOR2
COLOR_05="#1b6fc2"          # PATH
COLOR_06="#6f1bc2"          # SYNTAX_VAR
COLOR_07="#1bc26f"          # PROMP
COLOR_08="#808080"          #

COLOR_09="#808080"          #
COLOR_10="#ee84b9"          # COMMAND_ERROR
COLOR_11="#b9ee84"          # EXEC
COLOR_12="#eeb984"          #
COLOR_13="#84b9ee"          # FOLDER
COLOR_14="#b984ee"          #
COLOR_15="#84eeb9"          #
COLOR_16="#e5e5e5"          #

BACKGROUND_COLOR="#feffee"  # Background Color
FOREGROUND_COLOR="#23476a"  # Text
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
