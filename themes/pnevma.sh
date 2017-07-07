#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2f2e2d"           # HOST
COLOR_02="#a36666"           # SYNTAX_STRING
COLOR_03="#90a57d"           # COMMAND
COLOR_04="#d7af87"           # COMMAND_COLOR2
COLOR_05="#7fa5bd"           # PATH
COLOR_06="#c79ec4"           # SYNTAX_VAR
COLOR_07="#8adbb4"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#4a4845"           #
COLOR_10="#d78787"           # COMMAND_ERROR
COLOR_11="#afbea2"           # EXEC
COLOR_12="#e4c9af"           #
COLOR_13="#a1bdce"           # FOLDER
COLOR_14="#d7beda"           #
COLOR_15="#b1e7dd"           #
COLOR_16="#efefef"           #

BACKGROUND_COLOR="#1c1c1c"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Pnevma"
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
