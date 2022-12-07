#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#F2E9E1"           # Black
export COLOR_02="#B4637A"           # Red
export COLOR_03="#56949F"           # Green
export COLOR_04="#EA9D34"           # Yellow
export COLOR_05="#286983"           # Blue
export COLOR_06="#907AA9"           # Magenta
export COLOR_07="#D7827E"           # Cyan
export COLOR_08="#575279"           # Light gray

export COLOR_09="#9893A5"           # Dark gray
export COLOR_10="#B4637A"           # Light Red
export COLOR_11="#56949F"           # Light Green
export COLOR_12="#EA9D34"           # Light Yellow
export COLOR_13="#286983"           # Light Blue
export COLOR_14="#907AA9"           # Light Magenta
export COLOR_15="#D7827E"           # Light Cyan
export COLOR_16="#575279"           # White

export BACKGROUND_COLOR="#FAF4ED"   # Background Color
export FOREGROUND_COLOR="#575279"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Rosé Pine Dawn"
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
