#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d62e4e"           # SYNTAX_STRING
COLOR_03="#71be6b"           # COMMAND
COLOR_04="#beb86b"           # COMMAND_COLOR2
COLOR_05="#489bee"           # PATH
COLOR_06="#e979d7"           # SYNTAX_VAR
COLOR_07="#6bbeb8"           # PROMP
COLOR_08="#d6d6d6"           #

COLOR_09="#262626"           #
COLOR_10="#e02553"           # COMMAND_ERROR
COLOR_11="#aff08c"           # EXEC
COLOR_12="#dfddb7"           #
COLOR_13="#65aaf1"           # FOLDER
COLOR_14="#ddb7df"           #
COLOR_15="#b7dfdd"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#762423"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Red Alert"
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
