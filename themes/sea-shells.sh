#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#17384c"           # HOST
COLOR_02="#d15123"           # SYNTAX_STRING
COLOR_03="#027c9b"           # COMMAND
COLOR_04="#fca02f"           # COMMAND_COLOR2
COLOR_05="#1e4950"           # PATH
COLOR_06="#68d4f1"           # SYNTAX_VAR
COLOR_07="#50a3b5"           # PROMP
COLOR_08="#deb88d"           #

COLOR_09="#434b53"           #
COLOR_10="#d48678"           # COMMAND_ERROR
COLOR_11="#628d98"           # EXEC
COLOR_12="#fdd39f"           #
COLOR_13="#1bbcdd"           # FOLDER
COLOR_14="#bbe3ee"           #
COLOR_15="#87acb4"           #
COLOR_16="#fee4ce"           #

BACKGROUND_COLOR="#09141b"   # Background Color
FOREGROUND_COLOR="#deb88d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sea Shells"
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
