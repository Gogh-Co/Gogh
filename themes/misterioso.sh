#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ff4242"           # SYNTAX_STRING
COLOR_03="#74af68"           # COMMAND
COLOR_04="#ffad29"           # COMMAND_COLOR2
COLOR_05="#338f86"           # PATH
COLOR_06="#9414e6"           # SYNTAX_VAR
COLOR_07="#23d7d7"           # PROMP
COLOR_08="#e1e1e0"           #

COLOR_09="#555555"           #
COLOR_10="#ff3242"           # COMMAND_ERROR
COLOR_11="#74cd68"           # EXEC
COLOR_12="#ffb929"           #
COLOR_13="#23d7d7"           # FOLDER
COLOR_14="#ff37ff"           #
COLOR_15="#00ede1"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#2d3743"   # Background Color
FOREGROUND_COLOR="#e1e1e0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Misterioso"
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
