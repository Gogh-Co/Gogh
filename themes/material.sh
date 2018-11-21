#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073641"
COLOR_02="#EB606B"
COLOR_03="#C3E88D"
COLOR_04="#F7EB95"
COLOR_05="#80CBC3"
COLOR_06="#FF2490"
COLOR_07="#AEDDFF"
COLOR_08="#FFFFFF"

COLOR_09="#002B36"
COLOR_10="#EB606B"
COLOR_11="#C3E88D"
COLOR_12="#F7EB95"
COLOR_13="#7DC6BF"
COLOR_14="#6C71C3"
COLOR_15="#34434D"
COLOR_16="#FFFFFF"

BACKGROUND_COLOR="#1E282C"
FOREGROUND_COLOR="#C3C7D1"
CURSOR_COLOR="#657B83"
PROFILE_NAME="Material"
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