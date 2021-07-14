#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#0f0f14"           # Black
export COLOR_02="#8c4351"           # Red
export COLOR_03="#485e30"           # Green
export COLOR_04="#8f5e15"           # Yellow
export COLOR_05="#34548a"           # Blue
export COLOR_06="#5a4a78"           # Magenta
export COLOR_07="#0f4b6e"           # Cyan
export COLOR_08="#343b58"           # Light gray

export COLOR_09="#9699a3"           # Dark gray
export COLOR_10="#8c4351"           # Light Red
export COLOR_11="#485e30"           # Light Green
export COLOR_12="#8f5e15"           # Light Yellow
export COLOR_13="#34548a"           # Light Blue
export COLOR_14="#5a4a78"           # Light Magenta
export COLOR_15="#0f4b6e"           # Light Cyan
export COLOR_16="#343b58"           # White

export BACKGROUND_COLOR="#d5d6db"   # Background Color
export FOREGROUND_COLOR="#565a6e"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Tokyo Night Light"
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
