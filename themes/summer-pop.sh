#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#666666"           # Black
export COLOR_02="#FF1E8E"           # Red
export COLOR_03="#8EFF1E"           # Green
export COLOR_04="#FFFB00"           # Yellow
export COLOR_05="#1E8EFF"           # Blue
export COLOR_06="#E500E5"           # Magenta
export COLOR_07="#00E5E5"           # Cyan
export COLOR_08="#E5E5E5"           # Light gray

export COLOR_09="#666666"           # Dark gray
export COLOR_10="#FF1E8E"           # Light Red
export COLOR_11="#8EFF1E"           # Light Green
export COLOR_12="#FFFB00"           # Light Yellow
export COLOR_13="#1E8EFF"           # Light Blue
export COLOR_14="#E500E5"           # Light Magenta
export COLOR_15="#00E5E5"           # Light Cyan
export COLOR_16="#E5E5E5"           # White

export BACKGROUND_COLOR="#272822"   # Background Color
export FOREGROUND_COLOR="#FFFFFF"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="summer-pop"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/guillermoap/Gogh/master"}


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
