#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#321300"           # HOST
COLOR_02="#b2270e"           # SYNTAX_STRING
COLOR_03="#44a900"           # COMMAND
COLOR_04="#aa820c"           # COMMAND_COLOR2
COLOR_05="#58859a"           # PATH
COLOR_06="#97363d"           # SYNTAX_VAR
COLOR_07="#b25a1e"           # PROMP
COLOR_08="#786b53"           #

COLOR_09="#433626"           #
COLOR_10="#ed5d20"           # COMMAND_ERROR
COLOR_11="#55f238"           # EXEC
COLOR_12="#f2b732"           #
COLOR_13="#85cfed"           # FOLDER
COLOR_14="#e14c5a"           #
COLOR_15="#f07d14"           #
COLOR_16="#ffc800"           #

BACKGROUND_COLOR="#191919"   # Background Color
FOREGROUND_COLOR="#786b53"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Treehouse"
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
