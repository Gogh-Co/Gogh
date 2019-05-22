#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#20242d"           # Black
export COLOR_02="#FF8E8E"           # Red
export COLOR_03="#7EFDD0"           # Green
export COLOR_04="#FCAD3F"           # Yellow
export COLOR_05="#69B4F9"           # Blue
export COLOR_06="#DD92F6"           # Magenta
export COLOR_07="#8CE8ff"           # Cyan
export COLOR_08="#C9CCCD"           # Light gray

export COLOR_09="#20242d"           # Dark gray
export COLOR_10="#FF8E8E"           # Light Red
export COLOR_11="#7EFDD0"           # Light Green
export COLOR_12="#FCAD3F"           # Light Yellow
export COLOR_13="#69B4F9"           # Light Blue
export COLOR_14="#DD92F6"           # Light Magenta
export COLOR_15="#8CE8ff"           # Light Cyan
export COLOR_16="#C9CCCD"           # White

export BACKGROUND_COLOR="#20242d"   # Background Color
export FOREGROUND_COLOR="#C7C8FF"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="neon-night"
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
