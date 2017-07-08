#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#302b2a"           # HOST
COLOR_02="#a7463d"           # SYNTAX_STRING
COLOR_03="#587744"           # COMMAND
COLOR_04="#9d602a"           # COMMAND_COLOR2
COLOR_05="#485b98"           # PATH
COLOR_06="#864651"           # SYNTAX_VAR
COLOR_07="#9c814f"           # PROMP
COLOR_08="#c9c9c9"           #

COLOR_09="#4d4e48"           #
COLOR_10="#aa000c"           # COMMAND_ERROR
COLOR_11="#128c21"           # EXEC
COLOR_12="#fc6a21"           #
COLOR_13="#7999f7"           # FOLDER
COLOR_14="#fd8aa1"           #
COLOR_15="#fad484"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1a1818"   # Background Color
FOREGROUND_COLOR="#c9c9c9"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sundried"
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
