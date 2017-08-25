#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#282a2e"           # HOST
COLOR_02="#a54242"           # SYNTAX_STRING
COLOR_03="#a1b56c"           # COMMAND
COLOR_04="#de935f"           # COMMAND_COLOR2
COLOR_05="#225555"           # PATH
COLOR_06="#85678f"           # SYNTAX_VAR
COLOR_07="#5e8d87"           # PROMP
COLOR_08="#777777"           #

COLOR_09="#373b41"           #
COLOR_10="#c63535"           # COMMAND_ERROR
COLOR_11="#608360"           # EXEC
COLOR_12="#fa805a"           #
COLOR_13="#449da1"           # FOLDER
COLOR_14="#ba8baf"           #
COLOR_15="#86c1b9"           #
COLOR_16="#c5c8c6"           #

BACKGROUND_COLOR="#091116"   # Background Color
FOREGROUND_COLOR="#868A8C"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Terminix Dark"
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
