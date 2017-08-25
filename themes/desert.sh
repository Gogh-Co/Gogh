#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4d4d4d"           # HOST
COLOR_02="#ff2b2b"           # SYNTAX_STRING
COLOR_03="#98fb98"           # COMMAND
COLOR_04="#f0e68c"           # COMMAND_COLOR2
COLOR_05="#cd853f"           # PATH
COLOR_06="#ffdead"           # SYNTAX_VAR
COLOR_07="#ffa0a0"           # PROMP
COLOR_08="#f5deb3"           #

COLOR_09="#555555"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#55ff55"           # EXEC
COLOR_12="#ffff55"           #
COLOR_13="#87ceff"           # FOLDER
COLOR_14="#ff55ff"           #
COLOR_15="#ffd700"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#333333"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Desert"
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
