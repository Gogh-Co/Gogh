#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#929292"           # HOST
COLOR_02="#e27373"           # SYNTAX_STRING
COLOR_03="#94b979"           # COMMAND
COLOR_04="#ffba7b"           # COMMAND_COLOR2
COLOR_05="#97bedc"           # PATH
COLOR_06="#e1c0fa"           # SYNTAX_VAR
COLOR_07="#00988e"           # PROMP
COLOR_08="#dedede"           #

COLOR_09="#bdbdbd"           #
COLOR_10="#ffa1a1"           # COMMAND_ERROR
COLOR_11="#bddeab"           # EXEC
COLOR_12="#ffdca0"           #
COLOR_13="#b1d8f6"           # FOLDER
COLOR_14="#fbdaff"           #
COLOR_15="#1ab2a8"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#121212"   # Background Color
FOREGROUND_COLOR="#dedede"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Jellybeans"
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
