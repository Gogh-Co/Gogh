#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#44475a"           # Black
COLOR_02="#ff5555"           # Red
COLOR_03="#50fa7b"           # Green
COLOR_04="#ffb86c"           # Yellow
COLOR_05="#8be9fd"           # Blue
COLOR_06="#bd93f9"           # Cyan
COLOR_07="#ff79c6"           # Magenta
COLOR_08="#94A3A5"           # Light gray

COLOR_09="#000000"           # Dark gray
COLOR_10="#ff5555"           # Light Red
COLOR_11="#50fa7b"           # Light Green
COLOR_12="#ffb86c"           # Light Yellow
COLOR_13="#8be9fd"           # Light Blue
COLOR_14="#bd93f9"           # Light Cyan
COLOR_15="#ff79c6"           # Light Magenta
COLOR_16="#ffffff"           # White

BACKGROUND_COLOR="#282a36"   # Background Color
FOREGROUND_COLOR="#94A3A5"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="_base"
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