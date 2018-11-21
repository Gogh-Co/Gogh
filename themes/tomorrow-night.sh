#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#CC6666"
COLOR_03="#B5BD68"
COLOR_04="#F0C674"
COLOR_05="#81A2BE"
COLOR_06="#B293BB"
COLOR_07="#8ABEB7"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#CC6666"
COLOR_11="#B5BD68"
COLOR_12="#F0C574"
COLOR_13="#80A1BD"
COLOR_14="#B294BA"
COLOR_15="#8ABDB6"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#1D1F21"
FOREGROUND_COLOR="#C5C8C6"
CURSOR_COLOR="#C4C8C5"
PROFILE_NAME="Tomorrow Night"
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