#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#121C21"           # HOST
COLOR_02="#E44754"           # SYNTAX_STRING
COLOR_03="#89BD82"           # COMMAND
COLOR_04="#F7BD51"           # COMMAND_COLOR2
COLOR_05="#5486C0"           # PATH
COLOR_06="#B77EB8"           # SYNTAX_VAR
COLOR_07="#50A5A4"           # PROMP
COLOR_08="#FFFFFF"           #

COLOR_09="#52606B"           #
COLOR_10="#E44754"           # COMMAND_ERROR
COLOR_11="#89BD82"           # EXEC
COLOR_12="#F7BD51"           #
COLOR_13="#5486C0"           # FOLDER
COLOR_14="#B77EB8"           #
COLOR_15="#50A5A4"           #
COLOR_16="#FFFFFF"           #

BACKGROUND_COLOR="#121b21"   # Background Color
FOREGROUND_COLOR="#b3b8c3"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Oceanic Next"
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