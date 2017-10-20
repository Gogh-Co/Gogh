#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#4df840"           # COMMAND
COLOR_04="#f4fd22"           # COMMAND_COLOR2
COLOR_05="#2757d6"           # PATH
COLOR_06="#8c54fe"           # SYNTAX_VAR
COLOR_07="#38c8b5"           # PROMP
COLOR_08="#ccccc6"           #

COLOR_09="#505354"           #
COLOR_10="#ff5995"           # COMMAND_ERROR
COLOR_11="#b6e354"           # EXEC
COLOR_12="#feed6c"           #
COLOR_13="#3f78ff"           # FOLDER
COLOR_14="#9e6ffe"           #
COLOR_15="#23cfd5"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#1b1d1e"   # Background Color
FOREGROUND_COLOR="#f8f8f8"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Thayer Bright"
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
