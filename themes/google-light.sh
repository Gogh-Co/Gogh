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
