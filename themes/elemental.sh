#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3c3c30"           # HOST
COLOR_02="#98290f"           # SYNTAX_STRING
COLOR_03="#479a43"           # COMMAND
COLOR_04="#7f7111"           # COMMAND_COLOR2
COLOR_05="#497f7d"           # PATH
COLOR_06="#7f4e2f"           # SYNTAX_VAR
COLOR_07="#387f58"           # PROMP
COLOR_08="#807974"           #

COLOR_09="#555445"           #
COLOR_10="#e0502a"           # COMMAND_ERROR
COLOR_11="#61e070"           # EXEC
COLOR_12="#d69927"           #
COLOR_13="#79d9d9"           # FOLDER
COLOR_14="#cd7c54"           #
COLOR_15="#59d599"           #
COLOR_16="#fff1e9"           #

BACKGROUND_COLOR="#22211d"   # Background Color
FOREGROUND_COLOR="#807a74"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Elemental"
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
