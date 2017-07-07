#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#878787"           # HOST
COLOR_02="#ff6600"           # SYNTAX_STRING
COLOR_03="#ccff04"           # COMMAND
COLOR_04="#ffcc00"           # COMMAND_COLOR2
COLOR_05="#44b4cc"           # PATH
COLOR_06="#9933cc"           # SYNTAX_VAR
COLOR_07="#44b4cc"           # PROMP
COLOR_08="#f5f5f5"           #

COLOR_09="#555555"           #
COLOR_10="#ff0000"           # COMMAND_ERROR
COLOR_11="#00ff00"           # EXEC
COLOR_12="#ffff00"           #
COLOR_13="#0000ff"           # FOLDER
COLOR_14="#ff00ff"           #
COLOR_15="#00ffff"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Vibrant Ink"
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
