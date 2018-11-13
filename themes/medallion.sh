#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b64c00"           # SYNTAX_STRING
COLOR_03="#7c8b16"           # COMMAND
COLOR_04="#d3bd26"           # COMMAND_COLOR2
COLOR_05="#616bb0"           # PATH
COLOR_06="#8c5a90"           # SYNTAX_VAR
COLOR_07="#916c25"           # PROMP
COLOR_08="#cac29a"           #

COLOR_09="#5e5219"           #
COLOR_10="#ff9149"           # COMMAND_ERROR
COLOR_11="#b2ca3b"           # EXEC
COLOR_12="#ffe54a"           #
COLOR_13="#acb8ff"           # FOLDER
COLOR_14="#ffa0ff"           #
COLOR_15="#ffbc51"           #
COLOR_16="#fed698"           #

BACKGROUND_COLOR="#1d1908"   # Background Color
FOREGROUND_COLOR="#cac296"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Medallion"
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