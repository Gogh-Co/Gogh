#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2b2b2b"           # HOST
COLOR_02="#d45a60"           # SYNTAX_STRING
COLOR_03="#afba67"           # COMMAND
COLOR_04="#e5d289"           # COMMAND_COLOR2
COLOR_05="#a0bad6"           # PATH
COLOR_06="#c092d6"           # SYNTAX_VAR
COLOR_07="#91bfb7"           # PROMP
COLOR_08="#3c3d3d"           #

COLOR_09="#454747"           #
COLOR_10="#d3232f"           # COMMAND_ERROR
COLOR_11="#aabb39"           # EXEC
COLOR_12="#e5be39"           #
COLOR_13="#6699d6"           # FOLDER
COLOR_14="#ab53d6"           #
COLOR_15="#5fc0ae"           #
COLOR_16="#c1c2c2"           #

BACKGROUND_COLOR="#222222"   # Background Color
FOREGROUND_COLOR="#959595"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Later This Evening"
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
