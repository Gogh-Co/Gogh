#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3a3d43"           # HOST
COLOR_02="#be3f48"           # SYNTAX_STRING
COLOR_03="#879a3b"           # COMMAND
COLOR_04="#c5a635"           # COMMAND_COLOR2
COLOR_05="#4f76a1"           # PATH
COLOR_06="#855c8d"           # SYNTAX_VAR
COLOR_07="#578fa4"           # PROMP
COLOR_08="#b9bcba"           #

COLOR_09="#888987"           #
COLOR_10="#fb001f"           # COMMAND_ERROR
COLOR_11="#0f722f"           # EXEC
COLOR_12="#c47033"           #
COLOR_13="#186de3"           # FOLDER
COLOR_14="#fb0067"           #
COLOR_15="#2e706d"           #
COLOR_16="#fdffb9"           #

BACKGROUND_COLOR="#1f1f1f"   # Background Color
FOREGROUND_COLOR="#b9bcba"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Dimmed Monokai"
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
