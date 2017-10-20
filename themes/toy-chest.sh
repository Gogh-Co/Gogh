#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c3f58"           # HOST
COLOR_02="#be2d26"           # SYNTAX_STRING
COLOR_03="#1a9172"           # COMMAND
COLOR_04="#db8e27"           # COMMAND_COLOR2
COLOR_05="#325d96"           # PATH
COLOR_06="#8a5edc"           # SYNTAX_VAR
COLOR_07="#35a08f"           # PROMP
COLOR_08="#23d183"           #

COLOR_09="#336889"           #
COLOR_10="#dd5944"           # COMMAND_ERROR
COLOR_11="#31d07b"           # EXEC
COLOR_12="#e7d84b"           #
COLOR_13="#34a6da"           # FOLDER
COLOR_14="#ae6bdc"           #
COLOR_15="#42c3ae"           #
COLOR_16="#d5d5d5"           #

BACKGROUND_COLOR="#24364b"   # Background Color
FOREGROUND_COLOR="#31d07b"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Toy Chest"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
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
