#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#15171c"           # HOST
COLOR_02="#b24a56"           # SYNTAX_STRING
COLOR_03="#92b477"           # COMMAND
COLOR_04="#c6735a"           # COMMAND_COLOR2
COLOR_05="#7c8fa5"           # PATH
COLOR_06="#a5789e"           # SYNTAX_VAR
COLOR_07="#80cdcb"           # PROMP
COLOR_08="#b3b8c3"           #

COLOR_09="#555555"           #
COLOR_10="#ec5f67"           # COMMAND_ERROR
COLOR_11="#89e986"           # EXEC
COLOR_12="#fec254"           #
COLOR_13="#5486c0"           # FOLDER
COLOR_14="#bf83c1"           #
COLOR_15="#58c2c1"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#c9c6bc"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="SpaceGray Eighties Dull"
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
