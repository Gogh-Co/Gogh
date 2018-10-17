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
