#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#011627"           # Black
export COLOR_02="#EF5350"           # Red
export COLOR_03="#22da6e"           # Green
export COLOR_04="#addb67"           # Yellow
export COLOR_05="#82aaff"           # Blue
export COLOR_06="#c792ea"           # Magenta
export COLOR_07="#21c7a8"           # Cyan
export COLOR_08="#ffffff"           # Light gray

export COLOR_09="#575656"           # Dark gray
export COLOR_10="#ef5350"           # Light Red
export COLOR_11="#22da6e"           # Light Green
export COLOR_12="#ffeb95"           # Light Yellow
export COLOR_13="#82aaff"           # Light Blue
export COLOR_14="#c792ea"           # Light Magenta
export COLOR_15="#7fdbca"           # Light Cyan
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#011627"   # Background Color
export FOREGROUND_COLOR="#d6deeb"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Night Owl"
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
