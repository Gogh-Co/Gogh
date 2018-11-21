#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#373D48"           # Black
COLOR_02="#9B3E46"           # Red
COLOR_03="#095B32"           # Green
COLOR_04="#808020"           # Yellow
COLOR_05="#1D3E6F"           # Blue
COLOR_06="#823065"           # Cyan
COLOR_07="#3A7458"           # Magenta
COLOR_08="#828282"           # Light gray

COLOR_09="#5C6370"           # Dark gray
COLOR_10="#D0555F"           # Light Red
COLOR_11="#119955"           # AM77 Green
COLOR_12="#DFE048"           # Light Yellow
COLOR_13="#4674B8"           # Light Blue
COLOR_14="#ED86C9"           # Light Cyan
COLOR_15="#70D2A4"           # Light Magenta
COLOR_16="#DFDFDF"           # White

BACKGROUND_COLOR="#2F2F2F"   # Background Color
FOREGROUND_COLOR="#DFDFDF"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="nighty"
# =============================================







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