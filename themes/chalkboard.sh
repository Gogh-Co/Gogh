#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#c37372"           # SYNTAX_STRING
COLOR_03="#72c373"           # COMMAND
COLOR_04="#c2c372"           # COMMAND_COLOR2
COLOR_05="#7372c3"           # PATH
COLOR_06="#c372c2"           # SYNTAX_VAR
COLOR_07="#72c2c3"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#323232"           #
COLOR_10="#dbaaaa"           # COMMAND_ERROR
COLOR_11="#aadbaa"           # EXEC
COLOR_12="#dadbaa"           #
COLOR_13="#aaaadb"           # FOLDER
COLOR_14="#dbaada"           #
COLOR_15="#aadadb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#29262f"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Chalkboard"
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
