#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1C1B19"           # HOST
COLOR_02="#FF3128"           # SYNTAX_STRING
COLOR_03="#519F50"           # COMMAND
COLOR_04="#FBB829"           # COMMAND_COLOR2
COLOR_05="#5573A3"           # PATH
COLOR_06="#E02C6D"           # SYNTAX_VAR
COLOR_07="#0AAEB3"           # PROMP
COLOR_08="#918175"           #

COLOR_09="#2D2B28"           #
COLOR_10="#F75341"           # COMMAND_ERROR
COLOR_11="#98BC37"           # EXEC
COLOR_12="#FED06E"           #
COLOR_13="#8EB2F7"           # FOLDER
COLOR_14="#E35682"           #
COLOR_15="#53FDE9"           #
COLOR_16="#FCE8C3"           #

BACKGROUND_COLOR="#282828"   # Background Color
FOREGROUND_COLOR="#ebdbb2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Srcery"
# =============================================







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