#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1a1a1a"           # HOST
COLOR_02="#f4005f"           # SYNTAX_STRING
COLOR_03="#98e024"           # COMMAND
COLOR_04="#fa8419"           # COMMAND_COLOR2
COLOR_05="#9d65ff"           # PATH
COLOR_06="#f4005f"           # SYNTAX_VAR
COLOR_07="#58d1eb"           # PROMP
COLOR_08="#c4c5b5"           #

COLOR_09="#625e4c"           #
COLOR_10="#f4005f"           # COMMAND_ERROR
COLOR_11="#98e024"           # EXEC
COLOR_12="#e0d561"           #
COLOR_13="#9d65ff"           # FOLDER
COLOR_14="#f4005f"           #
COLOR_15="#58d1eb"           #
COLOR_16="#f6f6ef"           #

BACKGROUND_COLOR="#1a1a1a"   # Background Color
FOREGROUND_COLOR="#c4c5b5"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Monokai Soda"
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