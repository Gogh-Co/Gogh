#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1d1d19"           # HOST
COLOR_02="#f18339"           # SYNTAX_STRING
COLOR_03="#9fd364"           # COMMAND
COLOR_04="#f4ef6d"           # COMMAND_COLOR2
COLOR_05="#5096be"           # PATH
COLOR_06="#695abc"           # SYNTAX_VAR
COLOR_07="#d63865"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#1d1d19"           #
COLOR_10="#d22a24"           # COMMAND_ERROR
COLOR_11="#a7d42c"           # EXEC
COLOR_12="#ff8949"           #
COLOR_13="#61b9d0"           # FOLDER
COLOR_14="#695abc"           #
COLOR_15="#d63865"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1d1f21"   # Background Color
FOREGROUND_COLOR="#b8dbef"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Flatland"
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
