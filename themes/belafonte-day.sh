#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#20111b"           # HOST
COLOR_02="#be100e"           # SYNTAX_STRING
COLOR_03="#858162"           # COMMAND
COLOR_04="#eaa549"           # COMMAND_COLOR2
COLOR_05="#426a79"           # PATH
COLOR_06="#97522c"           # SYNTAX_VAR
COLOR_07="#989a9c"           # PROMP
COLOR_08="#968c83"           #

COLOR_09="#5e5252"           #
COLOR_10="#be100e"           # COMMAND_ERROR
COLOR_11="#858162"           # EXEC
COLOR_12="#eaa549"           #
COLOR_13="#426a79"           # FOLDER
COLOR_14="#97522c"           #
COLOR_15="#989a9c"           #
COLOR_16="#d5ccba"           #

BACKGROUND_COLOR="#d5ccba"   # Background Color
FOREGROUND_COLOR="#45373c"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Belafonte Day"
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
