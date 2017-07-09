#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff615a"           # SYNTAX_STRING
COLOR_03="#b1e969"           # COMMAND
COLOR_04="#ebd99c"           # COMMAND_COLOR2
COLOR_05="#5da9f6"           # PATH
COLOR_06="#e86aff"           # SYNTAX_VAR
COLOR_07="#82fff7"           # PROMP
COLOR_08="#dedacf"           #

COLOR_09="#313131"           #
COLOR_10="#f58c80"           # COMMAND_ERROR
COLOR_11="#ddf88f"           # EXEC
COLOR_12="#eee5b2"           #
COLOR_13="#a5c7ff"           # FOLDER
COLOR_14="#ddaaff"           #
COLOR_15="#b7fff9"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#171717"   # Background Color
FOREGROUND_COLOR="#dedacf"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Wombat"
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
