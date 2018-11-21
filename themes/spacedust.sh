#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#6e5346"           # HOST
COLOR_02="#e35b00"           # SYNTAX_STRING
COLOR_03="#5cab96"           # COMMAND
COLOR_04="#e3cd7b"           # COMMAND_COLOR2
COLOR_05="#0f548b"           # PATH
COLOR_06="#e35b00"           # SYNTAX_VAR
COLOR_07="#06afc7"           # PROMP
COLOR_08="#f0f1ce"           #

COLOR_09="#684c31"           #
COLOR_10="#ff8a3a"           # COMMAND_ERROR
COLOR_11="#aecab8"           # EXEC
COLOR_12="#ffc878"           #
COLOR_13="#67a0ce"           # FOLDER
COLOR_14="#ff8a3a"           #
COLOR_15="#83a7b4"           #
COLOR_16="#fefff1"           #

BACKGROUND_COLOR="#0a1e24"   # Background Color
FOREGROUND_COLOR="#ecf0c1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Spacedust"
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