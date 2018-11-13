#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#303030"           # HOST
COLOR_02="#e1321a"           # SYNTAX_STRING
COLOR_03="#6ab017"           # COMMAND
COLOR_04="#ffc005"           # COMMAND_COLOR2
COLOR_05="#004f9e"           # PATH
COLOR_06="#ec0048"           # SYNTAX_VAR
COLOR_07="#2aa7e7"           # PROMP
COLOR_08="#f2f2f2"           #

COLOR_09="#5d5d5d"           #
COLOR_10="#ff361e"           # COMMAND_ERROR
COLOR_11="#7bc91f"           # EXEC
COLOR_12="#ffd00a"           #
COLOR_13="#0071ff"           # FOLDER
COLOR_14="#ff1d62"           #
COLOR_15="#4bb8fd"           #
COLOR_16="#a020f0"           #

BACKGROUND_COLOR="#101010"   # Background Color
FOREGROUND_COLOR="#f2f2f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Elementary"
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