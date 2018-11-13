#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3e3e3e"           # HOST
COLOR_02="#970b16"           # SYNTAX_STRING
COLOR_03="#07962a"           # COMMAND
COLOR_04="#f8eec7"           # COMMAND_COLOR2
COLOR_05="#003e8a"           # PATH
COLOR_06="#e94691"           # SYNTAX_VAR
COLOR_07="#89d1ec"           # PROMP
COLOR_08="#ffffff"           #

COLOR_09="#666666"           #
COLOR_10="#de0000"           # COMMAND_ERROR
COLOR_11="#87d5a2"           # EXEC
COLOR_12="#f1d007"           #
COLOR_13="#2e6cba"           # FOLDER
COLOR_14="#ffa29f"           #
COLOR_15="#1cfafe"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#f4f4f4"   # Background Color
FOREGROUND_COLOR="#3e3e3e"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Github"
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