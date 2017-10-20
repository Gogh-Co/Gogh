#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#232323"           # HOST
COLOR_02="#ff000f"           # SYNTAX_STRING
COLOR_03="#8ce10b"           # COMMAND
COLOR_04="#ffb900"           # COMMAND_COLOR2
COLOR_05="#008df8"           # PATH
COLOR_06="#6d43a6"           # SYNTAX_VAR
COLOR_07="#00d8eb"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#444444"           #
COLOR_10="#ff2740"           # COMMAND_ERROR
COLOR_11="#abe15b"           # EXEC
COLOR_12="#ffd242"           #
COLOR_13="#0092ff"           # FOLDER
COLOR_14="#9a5feb"           #
COLOR_15="#67fff0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0e1019"   # Background Color
FOREGROUND_COLOR="#fffaf4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Argonaut"
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
