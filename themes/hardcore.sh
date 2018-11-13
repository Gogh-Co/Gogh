#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1b1d1e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#a6e22e"           # COMMAND
COLOR_04="#fd971f"           # COMMAND_COLOR2
COLOR_05="#66d9ef"           # PATH
COLOR_06="#9e6ffe"           # SYNTAX_VAR
COLOR_07="#5e7175"           # PROMP
COLOR_08="#ccccc6"           #

COLOR_09="#505354"           #
COLOR_10="#ff669d"           # COMMAND_ERROR
COLOR_11="#beed5f"           # EXEC
COLOR_12="#e6db74"           #
COLOR_13="#66d9ef"           # FOLDER
COLOR_14="#9e6ffe"           #
COLOR_15="#a3babf"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#121212"   # Background Color
FOREGROUND_COLOR="#a0a0a0"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Hardcore"
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