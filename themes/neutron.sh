#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#23252b"           # HOST
COLOR_02="#b54036"           # SYNTAX_STRING
COLOR_03="#5ab977"           # COMMAND
COLOR_04="#deb566"           # COMMAND_COLOR2
COLOR_05="#6a7c93"           # PATH
COLOR_06="#a4799d"           # SYNTAX_VAR
COLOR_07="#3f94a8"           # PROMP
COLOR_08="#e6e8ef"           #

COLOR_09="#23252b"           #
COLOR_10="#b54036"           # COMMAND_ERROR
COLOR_11="#5ab977"           # EXEC
COLOR_12="#deb566"           #
COLOR_13="#6a7c93"           # FOLDER
COLOR_14="#a4799d"           #
COLOR_15="#3f94a8"           #
COLOR_16="#ebedf2"           #

BACKGROUND_COLOR="#1c1e22"   # Background Color
FOREGROUND_COLOR="#e6e8ef"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Neutron"
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