#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#17384c"           # HOST
COLOR_02="#d15123"           # SYNTAX_STRING
COLOR_03="#027c9b"           # COMMAND
COLOR_04="#fca02f"           # COMMAND_COLOR2
COLOR_05="#1e4950"           # PATH
COLOR_06="#68d4f1"           # SYNTAX_VAR
COLOR_07="#50a3b5"           # PROMP
COLOR_08="#deb88d"           #

COLOR_09="#434b53"           #
COLOR_10="#d48678"           # COMMAND_ERROR
COLOR_11="#628d98"           # EXEC
COLOR_12="#fdd39f"           #
COLOR_13="#1bbcdd"           # FOLDER
COLOR_14="#bbe3ee"           #
COLOR_15="#87acb4"           #
COLOR_16="#fee4ce"           #

BACKGROUND_COLOR="#09141b"   # Background Color
FOREGROUND_COLOR="#deb88d"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Sea Shells"
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