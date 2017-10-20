#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3e3e3e"           # HOST
COLOR_02="#970b16"           # SYNTAX_STRING
COLOR_03="#07962a"           # COMMAND
COLOR_04="#f8eec7"           # COMMAND_COLOR2
COLOR_05="#003e8a"           # PATH
COLOR_06="#e94691"           # SYNTAX_VAR
COLOR_07="#89d1ec"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#666666"           #
COLOR_10="#de0000"           # COMMAND_ERROR
COLOR_11="#87d5a2"           # EXEC
COLOR_12="#f1d007"           #
COLOR_13="#2e6cba"           # FOLDER
COLOR_14="#ffa29f"           #
COLOR_15="#1cfafe"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#f4f4f4"   # Background Color
FOREGROUND_COLOR="#3e3e3e"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Github"
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
