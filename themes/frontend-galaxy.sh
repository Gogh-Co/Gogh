#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#f9555f"           # SYNTAX_STRING
COLOR_03="#21b089"           # COMMAND
COLOR_04="#fef02a"           # COMMAND_COLOR2
COLOR_05="#589df6"           # PATH
COLOR_06="#944d95"           # SYNTAX_VAR
COLOR_07="#1f9ee7"           # PROMP
COLOR_08="#bbbbbb"           #

COLOR_09="#555555"           #
COLOR_10="#fa8c8f"           # COMMAND_ERROR
COLOR_11="#35bb9a"           # EXEC
COLOR_12="#ffff55"           #
COLOR_13="#589df6"           # FOLDER
COLOR_14="#e75699"           #
COLOR_15="#3979bc"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#1d2837"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Frontend Galaxy"
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