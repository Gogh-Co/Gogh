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
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
    echo ""
}

function curlsource() {
    f=$(mktemp -t curlsource)
    curl -o "$f" -s -L "$1"
    source "$f"
    rm -f "$f"
}

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"


if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
    source $PARENT_PATH"/apply-colors.sh"
else
    if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
