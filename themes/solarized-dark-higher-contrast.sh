#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#002831"           # HOST
COLOR_02="#d11c24"           # SYNTAX_STRING
COLOR_03="#6cbe6c"           # COMMAND
COLOR_04="#a57706"           # COMMAND_COLOR2
COLOR_05="#2176c7"           # PATH
COLOR_06="#c61c6f"           # SYNTAX_VAR
COLOR_07="#259286"           # PROMP
COLOR_08="#eae3cb"           #

COLOR_09="#006488"           #
COLOR_10="#f5163b"           # COMMAND_ERROR
COLOR_11="#51ef84"           # EXEC
COLOR_12="#b27e28"           #
COLOR_13="#178ec8"           # FOLDER
COLOR_14="#e24d8e"           #
COLOR_15="#00b39e"           #
COLOR_16="#fcf4dc"           #

BACKGROUND_COLOR="#001e27"   # Background Color
FOREGROUND_COLOR="#9cc2c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Solarized Dark Higher Contrast"
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
