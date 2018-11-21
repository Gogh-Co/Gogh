#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#090300"           # HOST
COLOR_02="#883932"           # SYNTAX_STRING
COLOR_03="#55a049"           # COMMAND
COLOR_04="#bfce72"           # COMMAND_COLOR2
COLOR_05="#40318d"           # PATH
COLOR_06="#8b3f96"           # SYNTAX_VAR
COLOR_07="#67b6bd"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#000000"           #
COLOR_10="#883932"           # COMMAND_ERROR
COLOR_11="#55a049"           # EXEC
COLOR_12="#bfce72"           #
COLOR_13="#40318d"           # FOLDER
COLOR_14="#8b3f96"           #
COLOR_15="#67b6bd"           #
COLOR_16="#f7f7f7"           #

BACKGROUND_COLOR="#40318d"   # Background Color
FOREGROUND_COLOR="#7869c4"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="C64"
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