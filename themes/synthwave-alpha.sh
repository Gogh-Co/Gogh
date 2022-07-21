#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#241b30"           # Black
export COLOR_02="#9a0048"           # Red
export COLOR_03="#00986c"           # Green
export COLOR_04="#adad3e"           # Yellow
export COLOR_05="#6e29ad"           # Blue
export COLOR_06="#b300ad"           # Magenta
export COLOR_07="#00b0b1"           # Cyan
export COLOR_08="#b9b1bc"           # Light gray

export COLOR_09="#7f7094"           # Dark gray
export COLOR_10="#e60a70"           # Light Red
export COLOR_11="#0ae4a4"           # Light Green
export COLOR_12="#f9f972"           # Light Yellow
export COLOR_13="#aa54f9"           # Light Blue
export COLOR_14="#ff00f6"           # Light Magenta
export COLOR_15="#00fbfd"           # Light Cyan
export COLOR_16="#f2f2e3"           # White

export BACKGROUND_COLOR="#241b30"   # Background Color
export FOREGROUND_COLOR="#f2f2e3"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Synthwave Alpha"
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
