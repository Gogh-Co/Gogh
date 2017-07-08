#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#112616"           # HOST
COLOR_02="#7f2b27"           # SYNTAX_STRING
COLOR_03="#2f7e25"           # COMMAND
COLOR_04="#717f24"           # COMMAND_COLOR2
COLOR_05="#2f6a7f"           # PATH
COLOR_06="#47587f"           # SYNTAX_VAR
COLOR_07="#327f77"           # PROMP
COLOR_08="#647d75"           #

COLOR_09="#3c4812"           #
COLOR_10="#e08009"           # COMMAND_ERROR
COLOR_11="#18e000"           # EXEC
COLOR_12="#bde000"           #
COLOR_13="#00aae0"           # FOLDER
COLOR_14="#0058e0"           #
COLOR_15="#00e0c4"           #
COLOR_16="#73fa91"           #

BACKGROUND_COLOR="#0f1610"   # Background Color
FOREGROUND_COLOR="#637d75"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Alien Blood"
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
