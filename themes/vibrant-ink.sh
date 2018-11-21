#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#878787"           # HOST
COLOR_02="#ff6600"           # SYNTAX_STRING
COLOR_03="#ccff04"           # COMMAND
COLOR_04="#ffcc00"           # COMMAND_COLOR2
COLOR_05="#44b4cc"           # PATH
COLOR_06="#9933cc"           # SYNTAX_VAR
COLOR_07="#44b4cc"           # PROMP
COLOR_08="#f5f5f5"           #

COLOR_09="#555555"           #
COLOR_10="#ff0000"           # COMMAND_ERROR
COLOR_11="#00ff00"           # EXEC
COLOR_12="#ffff00"           #
COLOR_13="#0000ff"           # FOLDER
COLOR_14="#ff00ff"           #
COLOR_15="#00ffff"           #
COLOR_16="#e5e5e5"           #

BACKGROUND_COLOR="#000000"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Vibrant Ink"
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