#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#050505"           # HOST
COLOR_02="#e9897c"           # SYNTAX_STRING
COLOR_03="#b6377d"           # COMMAND
COLOR_04="#ecebbe"           # COMMAND_COLOR2
COLOR_05="#a9cdeb"           # PATH
COLOR_06="#75507b"           # SYNTAX_VAR
COLOR_07="#c9caec"           # PROMP
COLOR_08="#f2f2f2"           #

COLOR_09="#141414"           #
COLOR_10="#f99286"           # COMMAND_ERROR
COLOR_11="#c3f786"           # EXEC
COLOR_12="#fcfbcc"           #
COLOR_13="#b6defb"           # FOLDER
COLOR_14="#ad7fa8"           #
COLOR_15="#d7d9fc"           #
COLOR_16="#e2e2e2"           #

BACKGROUND_COLOR="#0a1e24"   # Background Color
FOREGROUND_COLOR="#1a1a1a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Square"
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
