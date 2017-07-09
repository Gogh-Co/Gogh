#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#a60001"           # SYNTAX_STRING
COLOR_03="#00bb00"           # COMMAND
COLOR_04="#fecd22"           # COMMAND_COLOR2
COLOR_05="#3a9bdb"           # PATH
COLOR_06="#bb00bb"           # SYNTAX_VAR
COLOR_07="#00bbbb"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#555555"           #
COLOR_10="#ff0003"           # COMMAND_ERROR
COLOR_11="#93c863"           # EXEC
COLOR_12="#fef874"           #
COLOR_13="#a1d7ff"           # FOLDER
COLOR_14="#ff55ff"           #
COLOR_15="#55ffff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#283033"   # Background Color
FOREGROUND_COLOR="#cdcdcd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Obsidian"
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
