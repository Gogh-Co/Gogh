#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#3f3f3f"           # HOST
COLOR_02="#ff0883"           # SYNTAX_STRING
COLOR_03="#83ff08"           # COMMAND
COLOR_04="#ff8308"           # COMMAND_COLOR2
COLOR_05="#0883ff"           # PATH
COLOR_06="#8308ff"           # SYNTAX_VAR
COLOR_07="#08ff83"           # PROMP
COLOR_08="#bebebe"           #

COLOR_09="#474747"           #
COLOR_10="#ff1e8e"           # COMMAND_ERROR
COLOR_11="#8eff1e"           # EXEC
COLOR_12="#ff8e1e"           #
COLOR_13="#1e8eff"           # FOLDER
COLOR_14="#8e1eff"           #
COLOR_15="#1eff8e"           #
COLOR_16="#c4c4c4"           #

BACKGROUND_COLOR="#1f1305"   # Background Color
FOREGROUND_COLOR="#b4e1fd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Aco"
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