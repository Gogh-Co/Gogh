#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#151515"           # HOST
COLOR_02="#a53c23"           # SYNTAX_STRING
COLOR_03="#7b9246"           # COMMAND
COLOR_04="#d3a04d"           # COMMAND_COLOR2
COLOR_05="#6c99bb"           # PATH
COLOR_06="#9f4e85"           # SYNTAX_VAR
COLOR_07="#7dd6cf"           # PROMP
COLOR_08="#d0d0d0"           #

COLOR_09="#505050"           #
COLOR_10="#a53c23"           # COMMAND_ERROR
COLOR_11="#7b9246"           # EXEC
COLOR_12="#d3a04d"           #
COLOR_13="#547c99"           # FOLDER
COLOR_14="#9f4e85"           #
COLOR_15="#7dd6cf"           #
COLOR_16="#f5f5f5"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#d0d0d0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Afterglow"
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
