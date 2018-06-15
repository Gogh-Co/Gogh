#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#606D6F"           # Dark gray
COLOR_02="#EB9090"           # Pink
COLOR_03="#5EB30E"           # Green
COLOR_04="#C4A000"           # Yellow
COLOR_05="#71ACEC"           # Blue
COLOR_06="#D088C8"           # Cyan
COLOR_07="#3AE0E0"           # Magenta
COLOR_08="#D3D7CF"           # Light gray

COLOR_09="#75796E"           # Dark gray
COLOR_10="#FD9C9C"           # Light pink
COLOR_11="#8AE234"           # Light Green
COLOR_12="#FCE94F"           # Light Yellow
COLOR_13="#84B9F2"           # Light Blue
COLOR_14="#D296CB"           # Light Cyan
COLOR_15="#4AF5F5"           # Light Magenta
COLOR_16="#EEEEEC"           # White

BACKGROUND_COLOR="#8A0404"   # Background Color
FOREGROUND_COLOR="#D7D9D9"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="rafaalata"
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

gogh_colors

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
