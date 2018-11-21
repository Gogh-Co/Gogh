#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2E3436"           # Black
COLOR_02="#CC0000"           # Red
COLOR_03="#4E9A06"           # Green
COLOR_04="#C4A000"           # Yellow
COLOR_05="#3465A4"           # Blue
COLOR_06="#75507B"           # Cyan
COLOR_07="#06989A"           # Magenta
COLOR_08="#D3D7CF"           # Light gray

COLOR_09="#555753"           # Dark gray
COLOR_10="#EF2929"           # Light Red
COLOR_11="#8AE234"           # Light Green
COLOR_12="#FCE94F"           # Light Yellow
COLOR_13="#729FCF"           # Light Blue
COLOR_14="#AD7FA8"           # Light Cyan
COLOR_15="#34E2E2"           # Light Magenta
COLOR_16="#EEEEEC"           # White

BACKGROUND_COLOR="#300a24"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="Clone of Ubuntu"
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