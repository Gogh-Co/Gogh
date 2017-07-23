#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#282828"          # HOST
COLOR_02="#cc241d"          # SYNTAX_STRING
COLOR_03="#98971a"          # COMMAND
COLOR_04="#d79921"          # COMMAND_COLOR2
COLOR_05="#458588"          # PATH
COLOR_06="#b16286"          # SYNTAX_VAR
COLOR_07="#689d6a"          # PROMP
COLOR_08="#a89984"          #

COLOR_09="#928374"          #
COLOR_10="#fb4934"          # COMMAND_ERROR
COLOR_11="#b8bb26"          # EXEC
COLOR_12="#fabd2f"          #
COLOR_13="#83a598"          # FOLDER
COLOR_14="#d3869b"          #
COLOR_15="#8ec07c"          #
COLOR_16="#ebdbb2"          #

BACKGROUND_COLOR="#282828"  # Background Color
FOREGROUND_COLOR="#ebdbb2"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Gruvbox-dark"
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

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
gogh_colors
source $PARENT_PATH"/apply-colors.sh"

else
gogh_colors
source <(wget  -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
fi
