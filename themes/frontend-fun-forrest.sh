#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#d6262b"           # SYNTAX_STRING
COLOR_03="#919c00"           # COMMAND
COLOR_04="#be8a13"           # COMMAND_COLOR2
COLOR_05="#4699a3"           # PATH
COLOR_06="#8d4331"           # SYNTAX_VAR
COLOR_07="#da8213"           # PROMP
COLOR_08="#ddc265"           #

COLOR_09="#7f6a55"           #
COLOR_10="#e55a1c"           # COMMAND_ERROR
COLOR_11="#bfc65a"           # EXEC
COLOR_12="#ffcb1b"           #
COLOR_13="#7cc9cf"           # FOLDER
COLOR_14="#d26349"           #
COLOR_15="#e6a96b"           #
COLOR_16="#ffeaa3"           #

BACKGROUND_COLOR="#251200"   # Background Color
FOREGROUND_COLOR="#dec165"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Frontend Fun Forrest"
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
        eval "$(curl -so- "${BASE_URL}/apply-colors.sh")"
    else
        # Linux ships with wget
        eval "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
    fi
fi