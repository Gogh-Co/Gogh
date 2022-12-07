#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#232A2D"           # Black
export COLOR_02="#E57474"           # Red
export COLOR_03="#8CCF7E"           # Green
export COLOR_04="#E5C76B"           # Yellow
export COLOR_05="#67B0E8"           # Blue
export COLOR_06="#C47FD5"           # Magenta
export COLOR_07="#6CBFBF"           # Cyan
export COLOR_08="#B3B9B8"           # Light gray

export COLOR_09="#2D3437"           # Dark gray
export COLOR_10="#EF7E7E"           # Light Red
export COLOR_11="#96D988"           # Light Green
export COLOR_12="#F4D67A"           # Light Yellow
export COLOR_13="#71BAF2"           # Light Blue
export COLOR_14="#CE89DF"           # Light Magenta
export COLOR_15="#67CBE7"           # Light Cyan
export COLOR_16="#BDC3C2"           # White

export BACKGROUND_COLOR="#141B1E"   # Background Color
export FOREGROUND_COLOR="#DADADA"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Everblush"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
