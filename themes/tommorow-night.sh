#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#cc6666"           # SYNTAX_STRING
COLOR_03="#b5bd68"           # COMMAND
COLOR_04="#f0c674"           # COMMAND_COLOR2
COLOR_05="#81a2be"           # PATH
COLOR_06="#b294bb"           # SYNTAX_VAR
COLOR_07="#8abeb7"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#000000"           #
COLOR_10="#cc6666"           # COMMAND_ERROR
COLOR_11="#b5bd68"           # EXEC
COLOR_12="#f0c674"           #
COLOR_13="#81a2be"           # FOLDER
COLOR_14="#b294bb"           #
COLOR_15="#8abeb7"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1d1f21"   # Background Color
FOREGROUND_COLOR="#c5c8c6"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Tommorow Night"
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
