#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#363636"          # HOST
COLOR_02="#ff0883"          # SYNTAX_STRING
COLOR_03="#83ff08"          # COMMAND
COLOR_04="#ff8308"          # COMMAND_COLOR2
COLOR_05="#0883ff"          # PATH
COLOR_06="#8308ff"          # SYNTAX_VAR
COLOR_07="#08ff83"          # PROMP
COLOR_08="#b6b6b6"          #

COLOR_09="#424242"          #
COLOR_10="#ff1e8e"          # COMMAND_ERROR
COLOR_11="#8eff1e"          # EXEC
COLOR_12="#ff8e1e"          #
COLOR_13="#1e8eff"          # FOLDER
COLOR_14="#8e1eff"          #
COLOR_15="#1eff8e"          #
COLOR_16="#c2c2c2"          #

BACKGROUND_COLOR="#0d1926"  # Background Color
FOREGROUND_COLOR="#b4e1fd"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Aci"
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
