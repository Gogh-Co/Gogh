#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#E06C75"
COLOR_03="#98C379"
COLOR_04="#D19A66"
COLOR_05="#61AFEF"
COLOR_06="#C678DD"
COLOR_07="#56B6C2"
COLOR_08="#ABB2BF"

COLOR_09="#5C6370"
COLOR_10="#E06C75"
COLOR_11="#98C379"
COLOR_12="#D19A66"
COLOR_13="#61AFEF"
COLOR_14="#C678DD"
COLOR_15="#56B6C2"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#1E2127"
FOREGROUND_COLOR="#5C6370"
CURSOR_COLOR="#5C6370"
PROFILE_NAME="One Dark"
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