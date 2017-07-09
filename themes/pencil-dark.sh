#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#212121"           # HOST
COLOR_02="#c30771"           # SYNTAX_STRING
COLOR_03="#10a778"           # COMMAND
COLOR_04="#a89c14"           # COMMAND_COLOR2
COLOR_05="#008ec4"           # PATH
COLOR_06="#523c79"           # SYNTAX_VAR
COLOR_07="#20a5ba"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#424242"           #
COLOR_10="#fb007a"           # COMMAND_ERROR
COLOR_11="#5fd7af"           # EXEC
COLOR_12="#f3e430"           #
COLOR_13="#20bbfc"           # FOLDER
COLOR_14="#6855de"           #
COLOR_15="#4fb8cc"           #
COLOR_16="#f1f1f1"           #

BACKGROUND_COLOR="#212121"   # Background Color
FOREGROUND_COLOR="#f1f1f1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Pencil Dark"
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
