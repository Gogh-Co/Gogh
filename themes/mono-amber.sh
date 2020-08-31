#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#402500"           # Black
export COLOR_02="#FF9400"           # Red
export COLOR_03="#FF9400"           # Green
export COLOR_04="#FF9400"           # Yellow
export COLOR_05="#FF9400"           # Blue
export COLOR_06="#FF9400"           # Magenta
export COLOR_07="#FF9400"           # Cyan
export COLOR_08="#FF9400"           # Light gray

export COLOR_09="#FF9400"           # Dark gray
export COLOR_10="#FF9400"           # Light Red
export COLOR_11="#FF9400"           # Light Green
export COLOR_12="#FF9400"           # Light Yellow
export COLOR_13="#FF9400"           # Light Blue
export COLOR_14="#FF9400"           # Light Magenta
export COLOR_15="#FF9400"           # Light Cyan
export COLOR_16="#FF9400"           # White

export BACKGROUND_COLOR="#2B1900"   # Background Color
export FOREGROUND_COLOR="#FF9400"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="mono-amber"
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
