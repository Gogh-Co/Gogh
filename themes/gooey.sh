#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000009"           # Black
COLOR_02="#BB4F6C"           # Red
COLOR_03="#72CCAE"           # Green
COLOR_04="#C65E3D"           # Yellow
COLOR_05="#58B6CA"           # Blue
COLOR_06="#6488C4"           # Cyan
COLOR_07="#8D84C6"           # Magenta
COLOR_08="#858893"           # Light gray

COLOR_09="#1f222d"           # Dark gray
COLOR_10="#ee829f"           # Light Red
COLOR_11="#a5ffe1"           # Light Green
COLOR_12="#f99170"           # Light Yellow
COLOR_13="#8be9fd"           # Light Blue
COLOR_14="#97bbf7"           # Light Cyan
COLOR_15="#c0b7f9"           # Light Magenta
COLOR_16="#ffffff"           # White

BACKGROUND_COLOR="#0D101B"   # Background Color
FOREGROUND_COLOR="#EBEEF9"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="gooey"
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