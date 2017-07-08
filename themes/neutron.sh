#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#23252b"           # HOST
COLOR_02="#b54036"           # SYNTAX_STRING
COLOR_03="#5ab977"           # COMMAND
COLOR_04="#deb566"           # COMMAND_COLOR2
COLOR_05="#6a7c93"           # PATH
COLOR_06="#a4799d"           # SYNTAX_VAR
COLOR_07="#3f94a8"           # PROMP
COLOR_08="#e6e8ef"           #

COLOR_09="#23252b"           #
COLOR_10="#b54036"           # COMMAND_ERROR
COLOR_11="#5ab977"           # EXEC
COLOR_12="#deb566"           #
COLOR_13="#6a7c93"           # FOLDER
COLOR_14="#a4799d"           #
COLOR_15="#3f94a8"           #
COLOR_16="#ebedf2"           #

BACKGROUND_COLOR="#1c1e22"   # Background Color
FOREGROUND_COLOR="#e6e8ef"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Neutron"
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
