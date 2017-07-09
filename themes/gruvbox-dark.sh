#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#665c54"          # HOST
COLOR_02="#fb4934"          # SYNTAX_STRING
COLOR_03="#83a598"          # COMMAND
COLOR_04="#d79921"          # COMMAND_COLOR2
COLOR_05="#b16286"          # PATH
COLOR_06="#458588"          # SYNTAX_VAR
COLOR_07="#b8bb26"          # PROMP
COLOR_08="#d65d0e"          #

COLOR_09="#a89984"          #
COLOR_10="#fb4934"          # COMMAND_ERROR
COLOR_11="#8ec07c"          # EXEC
COLOR_12="#fabd2f"          #
COLOR_13="#d3869b"          # FOLDER
COLOR_14="#689d6a"          #
COLOR_15="#98971a"          #
COLOR_16="#fe8019"          #

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
