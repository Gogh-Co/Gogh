#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#a6e22e"           # COMMAND
COLOR_04="#fd971f"           # COMMAND_COLOR2
COLOR_05="#66d9ef"           # PATH
COLOR_06="#9e6ffe"           # SYNTAX_VAR
COLOR_07="#5e7175"           # PROMP
COLOR_08="#ccccc6"           #

COLOR_09="#505354"           #
COLOR_10="#ff669d"           # COMMAND_ERROR
COLOR_11="#beed5f"           # EXEC
COLOR_12="#e6db74"           #
COLOR_13="#66d9ef"           # FOLDER
COLOR_14="#9e6ffe"           #
COLOR_15="#a3babf"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#121212"   # Background Color
FOREGROUND_COLOR="#a0a0a0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hardcore"
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
