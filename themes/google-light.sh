#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#FFFFFF"           # Black
COLOR_02="#CC342B"           # Red
COLOR_03="#198844"           # Green
COLOR_04="#FBA921"           # Yellow
COLOR_05="#3870ED"           # Blue
COLOR_06="#A26AC7"           # Cyan
COLOR_07="#3870ED"           # Magenta
COLOR_08="#373B41"           # Light gray

COLOR_09="#C5C8C6"           # Dark gray
COLOR_10="#CC342B"           # Light Red
COLOR_11="#198844"           # Light Green
COLOR_12="#FBA921"           # Light Yellow
COLOR_13="#3870ED"           # Light Blue
COLOR_14="#A26AC7"           # Light Cyan
COLOR_15="#3870ED"           # Light Magenta
COLOR_16="#1D1F21"           # White

BACKGROUND_COLOR="#FFFFFF"   # Background Color
FOREGROUND_COLOR="#969896"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="base16: Google (light)"
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