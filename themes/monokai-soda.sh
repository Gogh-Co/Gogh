#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1a1a1a"           # HOST
COLOR_02="#f4005f"           # SYNTAX_STRING
COLOR_03="#98e024"           # COMMAND
COLOR_04="#fa8419"           # COMMAND_COLOR2
COLOR_05="#9d65ff"           # PATH
COLOR_06="#f4005f"           # SYNTAX_VAR
COLOR_07="#58d1eb"           # PROMP
COLOR_08="#c4c5b5"           #

COLOR_09="#625e4c"           #
COLOR_10="#f4005f"           # COMMAND_ERROR
COLOR_11="#98e024"           # EXEC
COLOR_12="#e0d561"           #
COLOR_13="#9d65ff"           # FOLDER
COLOR_14="#f4005f"           #
COLOR_15="#58d1eb"           #
COLOR_16="#f6f6ef"           #

BACKGROUND_COLOR="#1a1a1a"   # Background Color
FOREGROUND_COLOR="#c4c5b5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Monokai Soda"
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
