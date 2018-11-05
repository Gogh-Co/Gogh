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
