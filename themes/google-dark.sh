#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#1D1F21"           # Black
COLOR_02="#CC342B"           # Red
COLOR_03="#198844"           # Green
COLOR_04="#FBA922"           # Yellow
COLOR_05="#3971ED"           # Blue
COLOR_06="#A36AC7"           # Cyan
COLOR_07="#3971ED"           # Magenta
COLOR_08="#C5C8C6"           # Light gray

COLOR_09="#969896"           # Dark gray
COLOR_10="#CC342B"           # Light Red
COLOR_11="#198844"           # Light Green
COLOR_12="#FBA922"           # Light Yellow
COLOR_13="#3971ED"           # Light Blue
COLOR_14="#A36AC7"           # Light Cyan
COLOR_15="#3971ED"           # Light Magenta
COLOR_16="#FFFFFF"           # White

BACKGROUND_COLOR="#1D1F21"   # Background Color
FOREGROUND_COLOR="#B4B7B4"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="base16: Google (dark)"
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