#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#44475a"           # HOST
COLOR_02="#ff5555"           # SYNTAX_STRING
COLOR_03="#50fa7b"           # COMMAND
COLOR_04="#ffb86c"           # COMMAND_COLOR2
COLOR_05="#8be9fd"           # PATH
COLOR_06="#bd93f9"           # SYNTAX_VAR
COLOR_07="#ff79c6"           # PROMP
COLOR_08="#94A3A5"           #

COLOR_09="#000000"           #
COLOR_10="#ff5555"           # COMMAND_ERROR
COLOR_11="#50fa7b"           # EXEC
COLOR_12="#ffb86c"           #
COLOR_13="#8be9fd"           # FOLDER
COLOR_14="#bd93f9"           #
COLOR_15="#ff79c6"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#282a36"   # Background Color
FOREGROUND_COLOR="#94A3A5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Dracula"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [ -e "${PARENT_PATH}/apply-colors.sh" ]
then
    source "${PARENT_PATH}/apply-colors.sh"
else
    if [ "$(uname)" = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        (eval "$(curl -so- "${BASE_URL}/apply-colors.sh")")
    else
        # Linux ships with wget
        (eval "$(wget -qO- "${BASE_URL}/apply-colors.sh")")
    fi
fi