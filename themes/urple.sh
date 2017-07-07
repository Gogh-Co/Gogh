#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b0425b"           # SYNTAX_STRING
COLOR_03="#37a415"           # COMMAND
COLOR_04="#ad5c42"           # COMMAND_COLOR2
COLOR_05="#564d9b"           # PATH
COLOR_06="#6c3ca1"           # SYNTAX_VAR
COLOR_07="#808080"           # PROMP
COLOR_08="#87799c"           #

COLOR_09="#5d3225"           #
COLOR_10="#ff6388"           # COMMAND_ERROR
COLOR_11="#29e620"           # EXEC
COLOR_12="#f08161"           #
COLOR_13="#867aed"           # FOLDER
COLOR_14="#a05eee"           #
COLOR_15="#eaeaea"           #
COLOR_16="#bfa3ff"           #

BACKGROUND_COLOR="#1b1b23"   # Background Color
FOREGROUND_COLOR="#877a9b"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Urple"
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
