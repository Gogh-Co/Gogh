#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#010101"           # HOST
COLOR_02="#f8b63f"           # SYNTAX_STRING
COLOR_03="#7fb5e1"           # COMMAND
COLOR_04="#d6da25"           # COMMAND_COLOR2
COLOR_05="#489e48"           # PATH
COLOR_06="#b296c6"           # SYNTAX_VAR
COLOR_07="#f5bfd7"           # PROMP
COLOR_08="#a8a49d"           #

COLOR_09="#726e6a"           #
COLOR_10="#f8b63f"           # COMMAND_ERROR
COLOR_11="#7fb5e1"           # EXEC
COLOR_12="#d6da25"           #
COLOR_13="#489e48"           # FOLDER
COLOR_14="#b296c6"           #
COLOR_15="#f5bfd7"           #
COLOR_16="#fefbea"           #

BACKGROUND_COLOR="#010101"   # Background Color
FOREGROUND_COLOR="#a8a49d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Harper"
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
