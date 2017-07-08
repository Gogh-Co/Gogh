#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#242526"           # HOST
COLOR_02="#f8511b"           # SYNTAX_STRING
COLOR_03="#565747"           # COMMAND
COLOR_04="#fa771d"           # COMMAND_COLOR2
COLOR_05="#2c70b7"           # PATH
COLOR_06="#f02e4f"           # SYNTAX_VAR
COLOR_07="#3ca1a6"           # PROMP
COLOR_08="#adadad"           #

COLOR_09="#5fac6d"           #
COLOR_10="#f74319"           # COMMAND_ERROR
COLOR_11="#74ec4c"           # EXEC
COLOR_12="#fdc325"           #
COLOR_13="#3393ca"           # FOLDER
COLOR_14="#e75e4f"           #
COLOR_15="#4fbce6"           #
COLOR_16="#8c735b"           #

BACKGROUND_COLOR="#1b1c1d"   # Background Color
FOREGROUND_COLOR="#adadad"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Frontend Delight"
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
