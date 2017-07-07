#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#121C21"           # HOST
COLOR_02="#E44754"           # SYNTAX_STRING
COLOR_03="#89BD82"           # COMMAND
COLOR_04="#F7BD51"           # COMMAND_COLOR2
COLOR_05="#5486C0"           # PATH
COLOR_06="#B77EB8"           # SYNTAX_VAR
COLOR_07="#50A5A4"           # PROMP
COLOR_08="#FFFFFF"           #

COLOR_09="#52606B"           #
COLOR_10="#E44754"           # COMMAND_ERROR
COLOR_11="#89BD82"           # EXEC
COLOR_12="#F7BD51"           #
COLOR_13="#5486C0"           # FOLDER
COLOR_14="#B77EB8"           #
COLOR_15="#50A5A4"           #
COLOR_16="#FFFFFF"           #

BACKGROUND_COLOR="#121b21"   # Background Color
FOREGROUND_COLOR="#b3b8c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Oceanic-Next"
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
