#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#333333"           # Black
export COLOR_02="#ff5555"           # Red
export COLOR_03="#5fd38d"           # Green
export COLOR_04="#ff9955"           # Yellow
export COLOR_05="#3771c8"           # Blue
export COLOR_06="#bc5fd3"           # Magenta
export COLOR_07="#5fd3bc"           # Cyan
export COLOR_08="#999999"           # Light gray

export COLOR_09="#666666"           # Dark gray
export COLOR_10="#ff8080"           # Light Red
export COLOR_11="#87deaa"           # Light Green
export COLOR_12="#ffb380"           # Light Yellow
export COLOR_13="#5f8dd3"           # Light Blue
export COLOR_14="#cd87de"           # Light Magenta
export COLOR_15="#87decd"           # Light Cyan
export COLOR_16="#cccccc"           # White

export BACKGROUND_COLOR="$COLOR_01"   # Background Color
export FOREGROUND_COLOR="$COLOR_16"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="DeHydration"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


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
