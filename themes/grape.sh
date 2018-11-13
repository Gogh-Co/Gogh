#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2d283f"           # HOST
COLOR_02="#ed2261"           # SYNTAX_STRING
COLOR_03="#1fa91b"           # COMMAND
COLOR_04="#8ddc20"           # COMMAND_COLOR2
COLOR_05="#487df4"           # PATH
COLOR_06="#8d35c9"           # SYNTAX_VAR
COLOR_07="#3bdeed"           # PROMP
COLOR_08="#9e9ea0"           #

COLOR_09="#59516a"           #
COLOR_10="#f0729a"           # COMMAND_ERROR
COLOR_11="#53aa5e"           # EXEC
COLOR_12="#b2dc87"           #
COLOR_13="#a9bcec"           # FOLDER
COLOR_14="#ad81c2"           #
COLOR_15="#9de3eb"           #
COLOR_16="#a288f7"           #

BACKGROUND_COLOR="#171423"   # Background Color
FOREGROUND_COLOR="#9f9fa1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Grape"
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